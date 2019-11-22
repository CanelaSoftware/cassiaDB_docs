# command cdb_renameKey pTable, pOldKeyName, pNewKeyName
---
## Summary
This command renames a key from a specific table.

## Inputs
* **pTable** *(String)* - The specified table ID or table name.

* **pOldKeyName** *(String)* - The current name of the key that will be renamed.

* **pNewKeyName** *(String)* - The new name that the key will be renamed to.

## Additional Requirements
* This API call requires internet access.
* This API requires Developer Auth. See [Accounts and Authorization](AddingUsers.md) for more details.

## Examples
```livecodeserver
local tTable, tOldKeyName, tNewName

# Table name: clients
# Keys: firstName, lastName, age, income

put "clients" into tTable
put "income" into tOldKeyName
put "salary" into tNewKeyName

cdb_renameKey tTable,tOldKeyName,tNewKeyName
```