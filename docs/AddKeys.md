# command cdb_addKeys pTable, pKeys
---
## Summary
This command adds new keys to a specific table.

## Inputs
* **pTable** *(String)* - The specified table ID or table name.

* **pKeys** *(String)* - The names of the keys that will be added to the table.

## Additional Requirements
This API call requires internet access.

## Examples
```livecodeserver
local tTable, tKeys

# Table name: clients
# Keys: firstName, lastName, age, income

put "clients" into tTable
put "occupation,address" into tKeys

cdb_addKeys(tTable,tKeys)
```