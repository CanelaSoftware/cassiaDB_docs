# command cdb_removeKeys(pTable, pKeys)
---
## Summary
This command removes keys from a specific table.

## Inputs
* pTable *(String)* - The specified table ID or table name.
* pKeys *(String)* - The comma-delimited list of key names from a table.

## Additional Requirements
This API call requires internet access in order to remove keys from a table in cloud records.

## Examples
```
local tTable, tKeys

# Table name: clients
# Keys: firstName, lastName, age, income

put "clients" into tTable
put "age,income" into tKeys

cdb_removeKeys(tTable,tKeys)
```