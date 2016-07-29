# cdb_unloadTable
---
```
command cdb_unloadTable tInputA
```

## Summary:
This command will unload a table from memory.

## Inputs:
* **`tInputA`** *(Array)* - An array of keys containing the cdbTableName.
    * `["cdbTableName"]` *(String)* - The specified table name to be unloaded, or a line-separated list of tables to be unloaded.
    	* Putting `"*"` or `empty` in this key will unload all tables.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tInputA
     
put "customers" into tInputA["cdbTableName"]
     
cdb_unloadTable tInputA
-- table "customers" is no longer loaded in memory
``` 