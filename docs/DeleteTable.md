# command cdb_deleteTable pTable
---
## Summary
This command deletes a table.

## Inputs
* **pTable** *(String)* - The specified table ID or table name.

## Additional Requirements
This API call requires internet access in order to delete a table in cloud records.

## Examples
```livecodeserver
local tTable

# Table name: clients

put "clients" into tTable

cdb_deleteTable(tTable)
```