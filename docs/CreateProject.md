# command cdb_createProject pProject
---
## Summary
This command creates a new project.

## Inputs
* **pProject** *(String)* - The specified project name.s

## Additional Requirements
This API call requires internet access in order to create a project in cloud records.

## Examples
```
local tProject

put "meeting" into tProject

cdb_createProject(tProject)
```