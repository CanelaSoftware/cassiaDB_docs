# function cdb_batchSync(pInputA)
---
Updated 12/17/19
## Summary
This function will sync records between local and cloud and across one or more tables.

## Inputs
* **pInputA** *(Array)* - A multidimensional array, where the first key is a tableID that maps to another array where the keys are cdbRecordID, source, allowDeletes, and detectCollisions.

	* [tableID]["cdbRecordID"] *(String)* - A line-delimited list of records to be synced. If "**\***" is passed, all records will be synced.
	* [tableID]["source"] *(String)* - Must be either "cloud" or "local". **Source** determines the direction of the sync. If "cloud" is chosen, records will be synced from cloud to local. If "local" is chosen, records will be synced from local to cloud.
	* [tableID]["allowDeletes"] *(Boolean)* - "True" or "False". A value of "true" means any recordIDs passed that are empty in the source (i.e. the record does not exist in the source) will be deleted in the target. A value of "false" means that no deletions will occur -- recordIDs that don't exist in the source will be ignored in the target.
	* [tableID]["detectCollisions"] *(Boolean)* - "True" or "False". A value of "true" means that the record versions between each record will be compared. Any time the source has a lower version (i.e. when the target record has been updated after the last time the source and target were in sync), the record will not be overwritten. Instead, the record will be listed in the response as a collision. A value of "false" means that records will not be compared for versions, and that all source records will overwrite all target records.

## Output
*(Array)* - An array with two keys:

* **["collisions"]** -
	* *(String)* - If there are no collisions, the value is 0.
	* *(Array)* - If there are collisions:
		* "Collisions" key is an array where each of its keys is a tableID mapped to recordIDs that were not synced. An empty value is mapped to these recordIDs.
* **["sync"]** -
	* *(String)* - If there are no records synced, the value is 0.
	* *(Array)* - If there are records synced:
		* "Sync" key is an array where each key is a tableID mapped to recordIDs and each recordID is mapped to a value, its cdbCloudSyncVersion.

![BatchSync output diagram](images/BatchSyncOutput.svg)

## Additional Requirements
This API call requires internet access.

## Examples
### Example 1:
```livecodeserver
# Tables: clients, office
## Example 1: Force our local to match what is on the cloud.

local tInputA, tClientsTableID, tOfficeTableID

put cdb_tableID("clients") into tClientsTableID
put cdb_tableID("office") into tOfficeTableID

put "*" into tInputA[tClientsTableID]["cdbRecordID"]
put "cloud" into tInputA[tClientsTableID]["source"]
put true into tInputA[tClientsTableID]["allowDeletes"]
put false into tInputA[tClientsTableID]["detectCollisions"]

put "*" into tInputA[tOfficeTableID]["cdbRecordID"]
put "cloud" into tInputA[tOfficeTableID]["source"]
put true into tInputA[tOfficeTableID]["allowDeletes"]
put false into tInputA[tOfficeTableID]["detectCollisions"]

get cdb_batchSync(tInputA)
     
# Local database will now have all records of cloud database.
# It will delete any records not on the cloud
# It will not check if anything local has been updated more recently.
```
### Example 2:
```livecodeserver
## Example 2: Make our cloud get anything new from our local
## But do not overwrite anything that is newer.

local tInputA, tOutputA, tClientsTableID, tOfficeTableID

put cdb_tableID("clients") into tClientsTableID
put cdb_tableID("office") into tOfficeTableID

put "*" into tInputA[tClientsTableID]["cdbRecordID"]
put "local" into tInputA[tClientsTableID]["source"]
put false into tInputA[tClientsTableID]["allowDeletes"]
put true into tInputA[tClientsTableID]["detectCollisions"]

put "*" into tInputA[tOfficeTableID]["cdbRecordID"]
put "local" into tInputA[tOfficeTableID]["source"]
put false into tInputA[tOfficeTableID]["allowDeletes"]
put true into tInputA[tOfficeTableID]["detectCollisions"]

put cdb_batchSync(tInputA) into tOutputA
repeat for each key xKey in tOutputA["collisions"][tClientsTableID]
	# Process our collisions here
end repeat
repeat for each key xKey in tOutputA["collisions"][tOfficeTableID]
	# Process our collisions here
end repeat
     
# Cloud database will now have all records of local database.
# It will not remove any records that only exist on cloud.
# It will not overwrite any records that are newer on cloud.
```
### Example 3:
```livecodeserver
## Example 3: Make our local data sync to what is on cloud
## Overwrite everything locally, but keep any records that
## only exist locally.

local tInputA, tClientsTableID, tOfficeTableID

put cdb_tableID("clients") into tClientsTableID
put cdb_tableID("office") into tOfficeTableID

put "*" into tInputA[tClientsTableID]["cdbRecordID"]
put "cloud" into tInputA[tClientsTableID]["source"]
put false into tInputA[tClientsTableID]["allowDeletes"]
put false into tInputA[tClientsTableID]["detectCollisions"]

put "*" into tInputA[tOfficeTableID]["cdbRecordID"]
put "cloud" into tInputA[tOfficeTableID]["source"]
put false into tInputA[tOfficeTableID]["allowDeletes"]
put false into tInputA[tOfficeTableID]["detectCollisions"]

get cdb_batchSync(tOutputA)
     
# Anything that exists on the cloud will now exist locally,
# It will not remove any records that only exist locally.
# It will overwrite all records, including newer records.

```
### Example 4:
```livecodeserver
## Example 4: Sync certain records from local to cloud
## Only overwrite if local is newer

local tClientsList, tInputA, tOutputA, tClientsTableID, tOfficeTableID

put cdb_tableID("clients") into tClientsTableID
put cdb_tableID("office") into tOfficeTableID

put "535f96c2-c08a-447d-9293-68183699a17a" into tClientsList
put lf & "cdb2dabc-cd91-49d3-af02-a69a73c5928e" after tClientsList
put lf & "7c397cb0-91bb-4f0a-9d42-5798af59b902" after tClientsList

put tClientsList into tInputA[tClientsTableID]["cdbRecordID"]
put "cloud" into tInputA[tClientsTableID]["source"]
put false into tInputA[tClientsTableID]["allowDeletes"]
put true into tInputA[tClientsTableID]["detectCollisions"]

put "5c384cu0-11rt-2k0n-6h48-3918aw59b682" into tInputA[tOfficeTableID]["cdbRecordID"]
put "cloud" into tInputA[tOfficeTableID]["source"]
put false into tInputA[tOfficeTableID]["allowDeletes"]
put true into tInputA[tOfficeTableID]["detectCollisions"]

put cdb_batchSync(tInputA) into tOutputA
repeat for each key xKey in tOutputA["collisions"][tClientsTableID]
	# Process our collisions here
end repeat
repeat for each key xKey in tOutputA["collisions"][tOfficeTableID]
	# Process our collisions here
end repeat
     
# These three records in clients table and single record in office table will be updated on the cloud.
# They will not overwrite records on the cloud that are newer.
```