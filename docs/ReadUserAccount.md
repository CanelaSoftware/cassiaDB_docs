# command cdb_readUserAccount pProjectName, pEmail

---
## Summary
This command reads a user account record in the cdbUsers table of a specific project.

## Inputs
* **pProjectName** *(String)* - The name of the project to read the user account record from.
* **pEmail** *(String)* - The email associated with the user's account.

## Additional Requirements
This API call requires internet access.


## Examples
```livecodeserver
# Project Name: meetings
# User's cdbRecordID: 23456789-abcd-8901-efgh-2345678901ij

local tProjectName, tEmail, tUserA

put "meetings" into tProjectName
put "cora@fakeemail.com" into tEmail

cdb_readUserAccount tProjectName,tEmail
put the result into tUserA

# tUserA["23456789-abcd-8901-efgh-2345678901ij"]["cdb"] - metadata
#						  ["firstName"] - value
#						  ["lastName"] - value
#						  ["email"] - value
#						  ["password"] - value
#						  ["hardwareID"] - value
#						  ["teamID"] - value
#						  ["projectName"] - value
#						  ["verified"] - value
```
