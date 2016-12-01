# command cdb_syncPartial pInputA
---
## Summary:
This command sync's any amount of specified records from a single table in a single direction.

## Inputs:
* **`tInputA`** *(Array)* - An array that specifies which table to sync and how to sync that table.
    * `["cdbTableName"]` *(String)* - The specified table to be synced.
    
    * `["cdbRecordID"]` *(Key)* - A line delimted list of recordIDs.

    * `["settings"]` *(Key)* - Key that maps to type of setting.
        
    	* `["source"]` *(String)* - 'Cloud' or 'local'. String determines the direction of the sync. If 'cloud' is chosen, records will be synced from cloud to local. If 'local' is chosen, records will be synced from local to cloud.
    	
   * `["settings"]` *(Key)* - Key that maps to type of setting.
 
		* `["preserveTarget"]` *(Boolean)* - 'True' or 'False'. A value of 'true' would preserve any records that do not have a matching cdbRecordID in the source. Records with a matching cdbRecordID in both source and target will have their cdbRecordVersion considered. The newer record will be synced from source to target. A value of 'false' will force the target to match the source records perfectly. Unique records in the target will be deleted.

## Outputs:
n/a
	
## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tInputA, tRecordIDList

#Table name: clients
#tRecordIDList: variable that contains a line delimited list of recordIDs
#Source: cloud or local
#PreserveTarget: true or false
     
put tRecordIDList into tInputA["cdbRecordID"]
put "clients" into tInputA["cdbTableName"]
put "local" into tInputA["settings"]["source"]
put true into tInputA["settings"]["preserveTarget"]
     
cdb_syncPartial tInputA

#Output: n/a

```
