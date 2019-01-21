# command cdb_unloadTable pTableL
---

## Summary
This command will unload table(s) from memory.

## Inputs
* **pTableL** *(String)* - The specified table name to be unloaded, or a line-separated list of tables to be unloaded.
	* Passing **"\*"** or **_empty_** will unload all tables.

## Examples
```livecodeserver
# "Customers" and "Office" tables are currently loaded and in memory

cdb_unloadTable "customers"

# Table "customers" is no longer loaded in memory

put cdb_list("customers","local")
# This will give an error because the "customers" table is not loaded.
``` 