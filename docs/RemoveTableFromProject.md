# command cdb_removeTableFromProject pProject, pTable
---
## Summary
This command unlinks a specific table from a project.

## Inputs
* **pProject** *(String)* - The name of the project in which the table belongs to.

* **pTable** *(String)* - The specified table ID or table name.

## Additional Requirements
This API call requires internet access.

## Examples
```
local tProject, tTable

put "meeting" into tProject
put "clients" into tTable

cdb_removeTableFromProject(tProject,tTable)
```