# function cdb_projectDetail(*pProject*)
---
Updated 11/22/19
## Summary
This function returns an array of the details of a project which consists of its tableIDs, project name, projectID, and the teamID. You cannot get the project details of another project within a client app.

## Inputs
* \***pProject** *(String)* - A project name or projectID. If empty is passed, the details of the project of the client app will be returned.

> _*optional parameter._
	
## Outputs
*(Array)* – An array whose keys consist of tableIDs, projectName, projectID, and teamID. The value of "tableIDs" is a comma-delimited list of tableIDs of the project and the values of the other keys are strings.

## Examples
```livecodeserver
local tProject, tOutputA

put "meeting" into tProject
put cdb_projectDetail(tProject) into tOutputA

# Output Array:
# tOutputA["tableIDs"] - "tableID_1,tableID_2,tableID_n"
#		  ["projectName"] - "meeting"
#		  ["projectID"] - "8fc03fe9-cd65-5358-hjk6-df85eb363984"
#		  ["teamID"] - "9fe03fc8-ef46-4835-bda6-bf58be273964"
```
