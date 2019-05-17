# function cdb_projectName(pProjectID)
---
## Summary
This function returns the name of the specified project. If no project ID is provided, whichever project name is found in the config file will be returned.

## Inputs
* **pProjectID** *(String)* - A projectID.

## Outputs
*(String)* - The project name of the provided projectID.

## Additional Requirements
This API call uses local data.

## Examples
```livecodeserver
local tProjectID

put "8fc03fe9-cd65-5358-hjk6-df85eb363984" into tProjectID
get cdb_projectName(tProjectID)

# Output: meeting
```