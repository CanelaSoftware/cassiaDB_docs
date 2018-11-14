# function cdb_sync(pRecordIDL,pTable,pSource,pAllowDeletes,pDetectCollisions)
---

## Summary
This function will sync all records in a specified table between local and cloud. 

## Inputs
* **pRecordIDL** *(String)* - A line-delimited list of records to be synced
	* If "**\***" is passed, all records will be synced. 

* **pTable** *(String)* - The specified table name or table ID to be synced.    

* **pSource** *(Enum)* - Must be either 'Cloud' or 'local'. **pSource** determines the direction of the sync. If 'cloud' is chosen, records will be synced from cloud to local. If 'local' is chosen, records will be synced from local to cloud.    	    

* **pAllowDeletes** *(Boolean)* - 'True' or 'False'. A value of 'true' means any recordIDs passed that are empty in the source (i.e. the record does not exist in the source) will be deleted in the target. A value of 'false' means that no deletions will occur -- recordIDs that don't exist in the source will be ignored in the target.

* **pDetectCollisions** *(Boolean)* - 'True' or 'False'. A value of 'true' means that the record versions between each record will be compared. Any time the source has a lower version (i.e. when the target record has been updated after the last time the source and target were in sync), the record will not be overwritten. Instead, the record will be listed in the response as a collision. A value of 'false' means that records will not be compared for versions, and that all source records will overwrite all target records.

## Output
(Array) - An array with two keys: 
	* **["sync"]** - A line-delimited list of records that were successfully synced.
	* **["collisions"]** - A line-delimited list of records that had collisions, and were therefore NOT synced. (This will always be empty if **pDetectCollisions** is false).

## Additional Requirements
* This API call requires internet access.

## Examples
```livecodeserver
# Table: clients
## Example 1: Force our local to match what is on the cloud.
     
get cdb_sync("*","clients","cloud",true,false)
     
# Local database will now have all records of cloud database.
# It will delete any records not on the cloud
# It will not check if anything local has been updated more recently.
```
```livecodeserver
## Example 2: Make our cloud get anything new from our local
## But do not overwrite anything that is newer.

put cdb_sync("*","clients","local",false,true) into tResultA
repeat for each line xL in tResultsA["collisions"]
	# Process our collisions here
end repeat
     
# Cloud database will now have all records of local database.
# It will not remove any records that only exist on cloud.
# It will not overwrite any records that are newer on cloud.
```
```livecodeserver
## Example 3: Make our local data sync to what is on cloud
## Overwrite everything locally, but keep any records that
## only exist locally.

get cdb_sync("*","clients","cloud",false,false)
     
# Anything that exists on the cloud will now exist locally,
# It will not remove any records that only exist locally.
# It will overwrite all records, including newer records.

```
```livecodeserver
## Example 4: Sync certain records from local to cloud
## Only overwrite if local is newer
put "535f96c2-c08a-447d-9293-68183699a17a" into tList
put lf & "cdb2dabc-cd91-49d3-af02-a69a73c5928e" after tList
put lf & "7c397cb0-91bb-4f0a-9d42-5798af59b902" after tList

put cdb_sync(tList,"clients","cloud",false,true) into tResultsA
repeat for each line xL in tResultsA["collisions"]
	# Process our collisions here
end repeat
     
# These three records will be updated on the cloud.
# They will not overwrite records on the cloud that are newer.

```