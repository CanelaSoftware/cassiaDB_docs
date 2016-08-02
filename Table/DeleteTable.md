# cdb_deleteTable
---
```
command cdb_deleteTable tInputA
```

## Summary:
This command will delete a table.

## Inputs:
* **`tInputA`** *(Array)* - An array of keys containing information to the table name.
    * `["cdbTableName"]` *(String)* - The specified table name to be deleted.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tInputA

put "clients" into tInputA["cdbTableName"]

cdb_deleteTable tInputA
``` 