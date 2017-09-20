# command cdb_loadTable pInputA
---

## Summary
This command will load a table into memory so it can be accessed through other CDB commands and functions. **LoadTable must be called prior to calling other CDB commands and functions.**

## Inputs
* **`tInputA`** *(Array)* - An array containing the tablename to be loaded.
    * `["cdbTableName"]` *(String)* - The specified table name to be loaded, or a line-separated list of tables to be loaded.
    	* Putting `"*"` in this key will load all tables, reloading any tables that have already been loaded.
    	* Putting `empty` in this key will load all tables that have not previously been loaded.

## API Version
* `0.3.0` - Introduced

## Examples
```
local tInputA
    
put "customers" into tInputA["cdbTableName"]

cdb_loadTable tInputA
# Table "customers" is loaded in memory and can now be used 
``` 
```
local tInputA
     
put "*" into tInputA["cdbTableName"]
     
cdb_loadTable tInputA
#All tables are now loaded
``` 