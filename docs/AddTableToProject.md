# command cdb_addTableToProject(pProject, pTable)
---
## Summary
This command links a specific table to a project.

## Inputs
* pProject *(String)* - The name of the project the table will be added to.
* pTable *(String)* - The specified table ID or table name.

## Additional Requirements
This API call requires internet access in order to add a table from a project in cloud records.

## Examples
```
local tProject, tTable

put "meeting" into tProject
put "clients" into tTable

cdb_addTableToProject(tProject,tTable)
```