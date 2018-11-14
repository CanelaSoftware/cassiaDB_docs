# command cdb_loadTable *pTableL*, *pCallbackControl*, *pCallbackHandler*
---

## Summary
This command will load table(s) into memory so they can be accessed through other CDB commands and functions. **LoadTable must be called prior to calling other CDB commands and functions.**

## Inputs
* \* **pTableL** *(String)* - The specified TableName/TableID to be loaded, or a line-delimited list of tables to be loaded.
    * Passing **"\*"** will load all tables, reloading any tables that have already been loaded.
    * Passing **_empty_** will load all tables that have not previously been loaded.

* \* **pCallbackControl** *(String)* - The control to dispatch the callback handler to. The callback handler will fire multiple times as each table is loaded. The long id of the callback control should be used in order to remove ambiguity.

* \* **pCallbackHandler** *(String)* - The handler to be dispatched dispatch while each table is being loaded. The handler will be dispatched with an array as the parameter. The array has the following keys:
    * **tableName** - The name of the table that is currently being loaded
    * **recordTotal** - The total number of records to load (for all tables)
    * **loadedTotal** - The number of records loaded (for all tables)
    * **recordSubTotal** - The total number of records to load for the current table
    * **loadedSubTotal** - The number of records loaded for the current table
    
> \* _Optional Parameter_

## Examples
```livecodeserver
cdb_loadTable "customers"
# Table "customers" is loaded in memory and can now be used 
``` 
```livecodeserver
cdb_loadTable "*"
# All tables are now loaded
```
```livecodeserver
cdb_loadTable "*",the long id of cd "sample","tableLoaded"
# All tables are now loaded
# As a portion of the records of each table are loaded,
# a callback "tableLoaded" will be dispatched to cd "sample",
# with an array detailing the amount of information loaded.
``` 