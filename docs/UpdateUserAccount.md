# command cdb_updateUserAccount pDataA, pEmail, pPassword, pSecureMode, pProjectName

---
## Summary
This command updates a user account record in the cdbUsers table for a specific project.

## Inputs
* **pDataA** *(Array)* - An array with the following format:
	* [*keyName 1*] *(String)* - A key as defined by the cdbUsers table's schema. User must provide at least one key.
		* value - The new value for the corresponding key.
	* [*keyName N*] *(String)* - A key as defined by the cdbUsers table's schema.
* **pEmail** *(String)* - The email associated with the user's account.
* \***pPassword** *(String)* - The password of the user's account. This is needed when **pSecureMode** is _true_. This is not needed when **pSecureMode** is false.
* **pSecureMode** *(String)* - Tells the cloud server whether to check the password or not. If **pSecureMode** is _true_, then the server will require the password of the user to be passed as **pPassword**. This will prevent other users from reading each others accounts. If this is _false_, then no password is required.
* \***pProjectName** *(String)* - The name of the project to read the user account record from. Defaults to the current (only) project.

![UpdateUserAccountInput](images/UpdateUserAccountInput.svg)


## Additional Requirements
This API call requires internet access.


## Examples
```livecodeserver
# Project Name: meetings

# Regular User Update -- Don't require a password. Most likely this should only be used if you have your own developer created keys in the cdbUsers table.

local tDataA, tProjectName, tEmail

put "meetings" into tProjectName
put "cora@fakeemail.com" into tEmail

# One or more keys
put "Coraline" into tDataA["firstName"]

cdb_updateUserAccount tDataA,tEmail,,false,tProjectName

# Secure User Update -- Require a password. 
# You can use this if user information should ONLY be editable for the logged in user. (We recommend this).

local tDataA, tProjectName, tEmail, tPassword

put "meetings" into tProjectName
put "cora@fakeemail.com" into tEmail

ask "Please re-enter your password for security purposes."
put it into tPassword

# One or more keys
put "Coraline" into tDataA["firstName"]

cdb_updateUserAccount tDataA,tEmail,tPassword,true,tProjectName
```
