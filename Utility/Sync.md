# cdb_sync
---
```
command cdb_sync tInputA
```

## Summary:
This command will sync the local table with the cloud table. The local table will delete all records not found on the cloud, add all new records from the cloud, and update all existing records to match the cloud.

## Inputs:
* **`tInputA`** *(Array)* - An array of keys containing the cdbTableName to be synced
    * `["cdbTableName"]` *(String)* - The specified table name to be synced

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