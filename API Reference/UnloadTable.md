# command cdb_unloadTable pInputA
---


## Summary:
This command will unload a table from memory.

## Inputs:
* **`tInputA`** *(Array)* - An array containing the tablename.
    * `["cdbTableName"]` *(String)* - The specified table name to be unloaded, or a line-separated list of tables to be unloaded.
    	* Putting `"*"` or `empty` in this key will unload all tables.

## API Version:
* `0.3` - Introduced

## Examples:
```
local tInputA
#Table name: customers
     
put "customers" into tInputA["cdbTableName"]
     
cdb_unloadTable tInputA
#Table "customers" is no longer loaded in memory
``` 