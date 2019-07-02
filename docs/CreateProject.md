# command cdb_createProject pProject
---
## Summary
This command creates a new project.

## Inputs
* **pProject** *(String)* - The specified project name.

## Additional Requirements
* This API call requires internet access in order to create a project.
* This API requires Developer Auth. See [Accounts and Authorization](AddingUsers.md) for more details.

## Examples
```livecodeserver
local tProject

put "meeting" into tProject

cdb_createProject tProject
```