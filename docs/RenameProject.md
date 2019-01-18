# command cdb_renameProject pProject, pNewName
---
## Summary
This command changes the name of a specific project.

## Inputs
* **pProject** *(String)* - The current name of the project.

* **pNewName** *(String)* - The new name that the project will be changed to.

## Additional Requirements
This API call requires internet access.

## Examples
```livecodeserver
local tProject, tNewName

# Project name: meeting

put "meeting" into tProject
put "organization" into tNewName

cdb_renameProject tProject,tNewName
```