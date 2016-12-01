# command cdb_deleteTable tInputA
---
### *** DEPRECATED -- THIS API IS NOW DEPRECATED. PLEASE USE [cdb_removeTable](./removeTable.md) INSTEAD ***

## Summary:
This command will delete a table.

## Inputs:
* **`tInputA`** *(Array)* - An array of keys containing information to the table name.
    * `["cdbTableName"]` *(String)* - The specified table name to be deleted.

## API Version:
* `0.3` - Deprecated

## Examples:
```
local tInputA

put "clients" into tInputA["cdbTableName"]

cdb_deleteTable tInputA
``` 