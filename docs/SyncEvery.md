# command cdb_syncEvery pInputA
---

## Summary
This command will sync all records in a specified table in one direction between cloud and local.

## Inputs
* **`tInputA`** *(Array)* - An array that specifies which table to sync and how to sync that table.
	* `["cdbTableName"]` *(String)* - The specified table to be synced.    
	* `["settings"]` *(Array)* - SubArray that maps to type of settings, as defined below:        
		* `["source"]` *(String)* - 'Cloud' or 'local'. String determines the direction of the sync. If 'cloud' is chosen, records will be synced from cloud to local. If 'local' is chosen, records will be synced from local to cloud.    	    
		* `["preserveTarget"]` *(Boolean)* - 'True' or 'False'. A value of 'true' would preserve any records that do not have a matching cdbRecordID in the source. Records with a matching cdbRecordID in both source and target will have their cdbRecordVersion considered. The newer record will be synced from source to target. A value of 'false' will force the target to match the source records perfectly. Unique records in the target will be deleted.

## Additional Requirements
* This API call requires internet access.

## API Version
* `0.3.3` - Introduced

## Examples
```
 local tInputA

#Table name: clients
#Source: cloud or local
#PreserveTarget: true or false
     
put "clients" into tInputA["cdbTableName"]
put "cloud" into tInputA["settings"]["source"]
put true into tInputA["settings"]["preserveTarget"]
     
cdb_syncEvery tInputA
     
# Local database will now have all records of cloud database (but will not delete records that only exist locally.)

``` 
