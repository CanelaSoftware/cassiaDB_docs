# function cdb_projectInfo(*pProject*)
---
Updated 11/22/19
## Summary
This function returns the name of the project and its projectID. You cannot get the project info of another project within a client app.

## Inputs
* \***pProject** *(String)* - A project name or projectID. If empty is passed, the project name and projectID of the client app will be returned.

> _*optional parameter._
	
## Outputs
* *(String)* – The project name and the projectID delimited by a comma.
* *(Bool)* – False if an error has occurred.

## Examples
```livecodeserver
local tProject

put "meeting" into tProject
get cdb_projectInfo(tProject)

# Output: meeting,8fc03fe9-cd65-5358-hjk6-df85eb363984
```
