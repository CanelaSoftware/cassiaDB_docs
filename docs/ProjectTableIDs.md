# function cdb_projectTableIDs(pProjectID)
---
## Summary
This function returns a comma-delimited list of tableIDs that belong to the specified project.

## Inputs
* **pProjectID** *(String)* - A projectID.

## Outputs
*(String)* - A comma-delimited list of tableIDs.

## Additional Requirements
This API call uses local data.

## Examples
```livecodeserver
local tProjectID

put "8fc03fe9-cd65-5358-hjk6-df85eb363984" into tProjectID
cdb_projectTableIDs(tProjectID)

# Output: 72a88e4f-c6ba-4fda-9381-2f0b0ca220bd,98765432-dcdc-0210-aaaa-975102a357ca
```