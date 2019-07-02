# command cdb_deleteUserAccount pEmail, pPassword, pSecureMode, pProjectName
---
## Summary
This command deletes a user account record in the cdbUsers table for a specific project.

## Inputs
* **pEmail** *(String)* - The email associated with the user's account.
* **pPassword** *(String)* - The password associated with the user's account.
* **pSecureMode** *(Boolean)* - Whether to require the user's password to delete the user.
* **pProjectName** *(String)* - The name of the project to delete the user account from.

## Additional Requirements
This API call requires internet access.


## Examples
```livecodeserver
# Project Name: meetings

local tProjectName, tEmail, tPassword

put "meetings" into tProjectName
put "cora@fakeemail.com" into tEmail
put "corasfakeemail" into tPassword

cdb_deleteUserAccount tEmail,tPassword,true,tProjectName
```
