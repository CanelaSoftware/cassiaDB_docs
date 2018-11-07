# command cdb_deleteProject(pProject)
---
## Summary
This command will delete a specified project and its tables unless the tables are linked to another project.

## Inputs
* pProject *(String)* - The specified project name.

## Additional Requirements
This API call requires internet access in order to delete a project in cloud records.

## Examples
```
local tProject

# Project name: meeting

put "meeting" into tProject

cdb_deleteProject(tProject)
```