# cdb_sync
---
```
command cdb_sync tInputA
```

## Summary:
This command will sync a specified local table with the same table on the cloud.

## Inputs:
* **`tInputA`** *(Array)* - An array with the name of the table to be synced.
    * `["cdbTableName"]` *(String)* - The specified table name to be synced
    * `*["syncMode"]` *(String)* - The method of resolving conflicts from the following options:
    	- `"cloudMaster"` *(default)* - Modifies local data to match the cloud.

## Additional Requirements:
This API call requires internet access.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tInputA
     
put "customers" into tInputA["cdbTableName"]
     
cdb_sync tInputA
``` 