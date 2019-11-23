# function cdb_userTableName(pProjectName)
---
Updated 11/22/19
## Summary
This function returns the table name of the cdbUsers table for a specified project. This function is needed in order to do normal Read/Update/Delete and Table operations on the cdbUsers table. Internally, the cdbUsers table is not named "cdbUsers". As such, this function is required in order to access the actual table records.

## Inputs
* **pProjectName** *(String)* - The name of the project.

## Outputs
*(String)* - The full table name of the cdbUsers table.

## Examples
```livecodeserver
local tProjectName

put "meetings" into tProjectName
put cdb_userTableName(tProjectName)

# Output: "cdbUsers-8fc03fe9-cd65-5358-hjk6-df85eb363984"
```