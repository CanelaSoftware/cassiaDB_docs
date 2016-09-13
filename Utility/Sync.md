# cdb_sync
---
```
command cdb_sync tInputA
```

## Summary:
This command will sync a specified table in the cloud to local direction, local to cloud direction, or bi-directional.

## Inputs:
* **`tInputA`** *(Array)* - An array with the name of the table to be synced.
    * `["cdbTableName"]` - The specified table to be synced.
    
    - `*["cloudMaster"]` *(default)* - Sync's records from cloud down to local.
    	- `"preserveLocal"` - Preserves any local records that are not on the cloud. If intra-record conflicts exist, then the cloud record overwrites a local record that has an identical record ID. 
    	- `"destroyLocal"` *(default)* - Does not preserve any local records that are not on the cloud. (Brute force brings cloud down to local). Default if "cloudMaster" key is empty.
    - `*["localMaster"]` - Sync's records from local up to the cloud.
    	- `"preserveCloud"` *(default)* - Preserves any cloud records that are not local. Default of "localMaster" key is empty. If intra-record conflicts exist, then the local record overwrites a cloud record that has an identical record ID.
    	- `"destroyCloud"` - Does not preserve any cloud records that are not local. (Brute force pushes local up to cloud). Default if "localMaster" key is empty. Note: be careful with this option, as it will destroy all cloud data in the specified table and overwrite with local.
    - `*["bidirectional"]` - Sync's records in both local to cloud and cloud to local direction. Hence, local gets cloud's unique records, and cloud gets local's unique records. If intra-record conflicts occur, then the record that was last modified takes precedence.
    	- `empty` - put empty into this key if being used.

> _*optional parameter._
> 
> Default functionality:
> 
> _1) If local or cloud master are NOT specified, then "cloudMaster" : "destroyLocal" is default._
> 
> _2) If "cloudMaster" is specified, then "cloudMaster" : "destroyLocal" is default._
> 
> _3) If "localMaster" is specified, then "localMaster" : "preserveCloud" is default. (For cloud safety reasons)_

## Additional Requirements:
This API call requires internet access.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
--This example of a sync wipes out local records in the specified table and sync's the clouds records down.

local tInputA
     
put "customers" into tInputA["cdbTableName"]
put empty into tInputA["cloudMaster"]
     
cdb_sync tInputA
``` 