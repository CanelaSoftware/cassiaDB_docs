# function cdb_projectNames()
---
## Summary
This function returns a list of project names.

## Outputs
* (String) - A comma-delimited list of project names.

## Additional Requirements
This API call requires internet access in order to get project names from cloud records.

## Examples
```livecodeserver
local tProjects

put cdb_projectNames() into tProjects

# Output: meetings, organizations
```