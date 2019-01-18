# command cdb_deleteUserAccount pProjectName, pEmail, pPassword

---
## Summary
This command deletes a user account record in the cdbUsers table for a specific project.

## Inputs
* **pProjectName** *(String)* - The name of the project to delete the user account from.
* **pEmail** *(String)* - The email associated with the user's account.
* **pPassword** *(String)* - The password associated with the user's account.

## Additional Requirements
This API call requires internet access.


## Examples
```livecodeserver
# Project Name: meetings

local tProjectName, tEmail, tPassword

put "meetings" into tProjectName
put "cora@fakeemail.com" into tEmail
put "corasfakeemail" into tPassword

cdb_deleteUserAccount tProjectName,tEmail,tPassword
```
