# function cdb_schemaless pTable
---
## Summary
This function returns true or false depending on if the specific table is schemaless or not.

## Inputs
* **pTable** *(String)* - The specified table ID or table name.

## Outputs
*(Boolean)* - If the table passed is schemaless, true is returned. Otherwise, false is returned.

## Additional Requirements
* This API call requires internet access.
* This API requires Developer Auth. See [Accounts and Authorization](AddingUsers.md) for more details.

## Examples
```livecodeserver
local tTable

put "clients" into tTable

put cdb_schemaless(tTable)

# Output: false
```