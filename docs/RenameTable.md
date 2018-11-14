# command cdb_renameTable pTable, pNewName
---
## Summary
This command changes the name of a specific table.

## Inputs
* **pTable** *(String)* - The specified table ID or table name.

* **pNewName** *(String)* - The new name the table will be renamed to.

## Additional Requirements
This API call requires internet access.

## Examples
```livecodeserver
local tTable, tNewName

# Table name: clients

put "clients" into tTable
put "customers" into tNewName

cdb_renameTable(tTable,tNewName)
```