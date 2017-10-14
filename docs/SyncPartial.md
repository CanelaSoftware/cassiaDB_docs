# command cdb_syncPartial pInputA
---
## Summary
This command syncs specified records from a single table in a single direction.

## Inputs
* **tInputA** *(Array)* - An array that specifies which table to sync and how to sync that table.
	* ["cdbTableName"] *(String)* - The specified table to be synced.    
	* ["cdbRecordID"] *(String)* - A line delimted list of recordIDs.
	* ["settings"] *(Array)* - SubArray that maps to type of settings, as defined below:
		* ["source"] *(String)* - 'Cloud' or 'local'. String determines the direction of the sync. If 'cloud' is chosen, records will be synced from cloud to local. If 'local' is chosen, records will be synced from local to cloud. 
		* ["preserveTarget"] *(Boolean)* - 'True' or 'False'. A value of 'true' would preserve any records that do not have a matching cdbRecordID in the source. Records with a matching cdbRecordID in both source and target will have their cdbRecordVersion considered. The newer record will be synced from source to target. A value of 'false' will force the target to match the source records perfectly. Unique records in the target will be deleted.

	
## API Version
* 0.3.3 - Introduced

## Examples
```
local tInputA, tRecordIDList

# Table name: clients
# tRecordIDList: variable that contains a line delimited list of recordIDs
# Source: cloud or local
# PreserveTarget: true or false
     
put tRecordIDList into tInputA["cdbRecordID"]
put "clients" into tInputA["cdbTableName"]
put "local" into tInputA["settings"]["source"]
put true into tInputA["settings"]["preserveTarget"]
     
cdb_syncPartial tInputA

# All records in tRecordIDList on the cloud will now match what is found locally.

```
