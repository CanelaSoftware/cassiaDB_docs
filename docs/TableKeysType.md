# function cdb_tableKeysType(pTable, *pType*)
---

## Summary
This function takes a table name or tableID and returns a comma-separated list of the keys of that table that are a certain type.

## Inputs
* **pTable** *(String)* - The tableID or table name whose keys should be returned.
* \***pType** *(String)* - Determines the key type to search for. If pType is empty or "*", then a list of all keys will be returned. Currently only "hyperblob" is accepted.

> _*optional parameter._

## Outputs
*(String)* - A comma-delimited list of the keys in the table.


## Examples
```livecodeserver
# Table Name: clients
# Keys: firstName, lastName, age, income, photo
# Photo is a hyperblob type.

local tTable, tType, tOutput

put "clients" into tTable
put "hyperblob" into tType
put cdb_tableKeysType(tTable,tType) into tOutput

# Output: photo
```