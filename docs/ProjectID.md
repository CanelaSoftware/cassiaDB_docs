# function cdb_projectID(pTeamID, pProjectName)
---
## Summary
This function takes a teamID and project name and returns the ID of that project.

## Inputs
* **pTeamID** *(String)* - The teamID the project belongs to.
* **pProjectName** *(String)* - The name of the project.

## Outputs
*(String)* - The project ID.

## Examples
```livecodeserver
local tTeamID, tProjectName

put "9fe03fc8-ef46-4835-bda6-bf58be273964" into tTeamID
put "meetings" into tProjectName

cdb_projectID(tTeamID,tProjectName)

# Output: 8fc03fe9-cd65-5358-hjk6-df85eb363984
```