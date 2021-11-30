# command cdb_deleteUserAccount pEmail, *pPassword*, pSecureMode, pProjectName
---
## Summary
This command deletes a user account record in the cdbUsers table for a specific project.

## Inputs
* **pEmail** *(String)* - The email associated with the user's account.
* \***pPassword** *(String)* - The password associated with the user's account.
* \***pSecureMode** *(Boolean)* - Whether to require the user's password to delete the user. Secure mode defaults to true if no value is passed. If you do not pass a value, please provide the user's password.
* \***pProjectName** *(String)* - The name of the project to delete the user account from. Setting this value is not necessary for most projects as only one project is loaded at a time.

> _*optional parameter._

## Additional Requirements
This API call requires internet access.


## Examples
```livecodeserver
# Project Name: meetings

local tProjectName, tEmail, tPassword

put "meetings" into tProjectName
put "cora@email.com" into tEmail
put "corasPassword" into tPassword

cdb_deleteUserAccount tEmail,tPassword,true,tProjectName
```
