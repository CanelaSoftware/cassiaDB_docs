# command cdb_renameKey pTable, pKey, pNewName
---
## Summary
This command renames a key from a specific table.

## Inputs
* **pTable** *(String)* - The specified table ID or table name.

* **pKey** *(String)* - The current name of the key that will be renamed.

* **pNewName** *(String)* - The new name that the key will be renamed to.

## Additional Requirements
This API call requires internet access.

## Examples
```livecodeserver
local tTable, tKey, tNewName

# Table name: clients
# Keys: firstName, lastName, age, income

put "clients" into tTable
put "income" into tKey
put "salary" into tNewName

cdb_renameKey tTable,tKey,tNewName
```