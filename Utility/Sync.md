# cdb_sync
---
```
command cdb_sync tInputA
```

## Summary:
This command will sync a specified table in the cloud to local direction, the local to cloud direction, or bi-directional.

## Inputs:
* **`tInputA`** *(Array)* - An array that specifies what table to sync and how to sync that table.
    * `["cdbTableName"]` - The specified table to be synced.
    
    - `*["cloudMaster"]` *(default)* - Sync's records from cloud down to local. Default case if no master is specified.
    	- `"preserveLocal"` - Local records that do not exist in the cloud are preserved. However, if a local record and cloud record have the same cdbRecordID but different contents, then the cloud record overwrites the local record since cloud is master.
    	- `"replaceLocal"` *(default)* - Does not preserve any local records that are not on the cloud. (Brute force brings cloud down to local). Default case if "cloudMaster" key is empty.
    - `*["localMaster"]` - Sync's records from local up to the cloud.
    	- `"preserveCloud"` *(default)* - Cloud records that do not exist in locally are preserved. However, if a local record and cloud record have the same cdbRecordID but different contents, then the local record overwrites the cloud record since local is master.
    	- `"replaceCloud"` - Does not preserve any cloud records that are not local. (Brute force pushes local up to cloud). Default case if "localMaster" key is empty. Note: user caution, as this will destroy all cloud data in the specified table and overwrite it with your local data.
    - `*["bidirectional"]` - Sync's records in both local to cloud and cloud to local direction. Hence, local gets cloud's unique records, and cloud gets local's unique records. If a local record and cloud record have the same cdbRecordID but different contents, then the record that was last modified takes precedence.
    	- `empty` - put empty into this key if it is being used.

> _*optional parameter._
> 
> Note: sync can be local master OR cloud master, but not both.
> 
> _1) If local or cloud master are NOT specified, then "cloudMaster" : "replaceLocal" is default._
> 
> _2) If "cloudMaster" is specified but is empty, then "cloudMaster" : "replaceLocal" is default._
> 
> _3) If "localMaster" is specified but is empty, then "localMaster" : "preserveCloud" is default._

## Additional Requirements:
This API call requires internet access.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
--This example syncs the "customers" table's cloud records down, overwriting any local data.
--tInputA["cloudMaster"] is empty so default is tInputA["cloudMaster"]["replaceLocal"]

local tInputA
     
put "customers" into tInputA["cdbTableName"]
put empty into tInputA["cloudMaster"]
     
cdb_sync tInputA
``` 