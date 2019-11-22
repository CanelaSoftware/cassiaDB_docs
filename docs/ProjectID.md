# function cdb_projectID(*pTeamID*, *pProjectName*)
---
## Summary
This function takes a teamID and project name and returns the ID of that project.

## Inputs
* \***pTeamID** *(String)* - The teamID the project belongs to. If this is empty, your active team ID will be used.
* \***pProjectName** *(String)* - The name of the project. If **"*"** or empty is passed for this parameter, a comma-delimited list of all project IDs will be returned.

> _*optional parameter._

## Outputs
*(String)* - The project ID or a comma-delimited list of project IDs.

## Examples
```livecodeserver
local tTeamID, tProjectName

put "9fe03fc8-ef46-4835-bda6-bf58be273964" into tTeamID
put "meetings" into tProjectName

cdb_projectID(tTeamID,tProjectName)

# Output: 8fc03fe9-cd65-5358-hjk6-df85eb363984
```

```livecodeserver
put cdb_projectID()

# Output: 8fc03fe9-cd65-5358-hjk6-df85eb363984,6sp03dj9-rm63-6281-ngt4-ab89wc367471
```