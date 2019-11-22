# command cdb_createProject pProjectName
---
## Summary
This command creates a new project.

## Inputs
* **pProjectName** *(String)* - The specified project name.

## Additional Requirements
* This API call requires internet access in order to create a project.
* This API requires Developer Auth. See [Accounts and Authorization](AddingUsers.md) for more details.

## Examples
```livecodeserver
local tProjectName

put "meeting" into tProjectName

cdb_createProject tProjectName
```