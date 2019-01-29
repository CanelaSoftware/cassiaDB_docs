# command cdb_createUserAccount pProjectName, pEmail, pPassword, *pFirstName*, *pLastName*, *pPreVerified*

---
## Summary
This command creates a user account record in the cdbUsers table of a specific project and sends the user an email to verify their account.

## Inputs
* **pProjectName** *(String)* - The name of the project to create the user account for.

* **pEmail** *(String)* - The email to associate with the user's account.

* **pPassword** *(String)* - The password to associate with the user's account.

* \***pFirstName** *(String)* - The user's first name.

* \***pLastName** *(String)* - The user's last name.

* \***pPreVerify** *(Boolean)* - Whether to automatically verify the user or not. If this is __true__ then the user will not need to verify their email prior to being able to log in. If this is __false__ or is not set, the user will need to verify their email prior to logging in.

> _*optional parameter._

## Additional Requirements
This API call requires internet access.


## Examples
```livecodeserver
# Project Name: meetings

local tProjectName, tEmail, tPassword, tFirstName, tLastName

put "meetings" into tProjectName
put "cora@fakeemail.com" into tEmail
put "corasfakeemail" into tPassword
put "Cora" into tFirstName
put "Doe" into tLastName

cdb_createUserAccount tProjectName,tEmail,tPassword,tFirstName,tLastName
```
