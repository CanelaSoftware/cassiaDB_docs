# function cdb_readUserAccount pEmail, *pPassword*, pSecureMode, *pProjectName*

---
## Summary
This command reads a user account record in the cdbUsers table of a specific project.

## Inputs
* **pEmail** *(String)* - The email associated with the user's account.
* \***pPassword** *(String)* - The password of the user's account. This is needed when **pSecureMode** is _true_. This is not needed when **pSecureMode** is false.
* **pSecureMode** *(String)* - Tells the cloud server whether to check the password or not. If **pSecureMode** is _true_, then the server will require the password of the user to be passed as **pPassword**. This will prevent other users from reading each others accounts. If this is _false_, then no password is required.
* \***pProjectName** *(String)* - The name of the project to read the user account record from. Defaults to the current (only) project.

## Additional Requirements
This API call requires internet access.

## Outputs
*(Array)* - The cdbUser record corresponding to the user with the specified email.

## Examples
```livecodeserver
# Project Name: meetings
# User's cdbRecordID: 23456789-abcd-8901-efgh-2345678901ij

# Regular User Read -- Don't require a password. 
# You can use this if user information should be available to all your users.
# (e.g. If you want to display a list of names for all users).

local tProjectName, tEmail, tUserA

put "meetings" into tProjectName
put "cora@fakeemail.com" into tEmail

put cdb_readUserAccount(tEmail,,false,tProjectName) into tUserA

# tUserA["23456789-abcd-8901-efgh-2345678901ij"]["cdb"] - metadata
#						  ["firstName"] - value
#						  ["lastName"] - value
#						  ["email"] - value
#						  ["password"] - value
#						  ["hardwareID"] - value
#						  ["teamID"] - value
#						  ["projectName"] - value
#						  ["verified"] - value



# Secure User Read -- Require a password. 
# You can use this if user information should ONLY be available for the logged in user.

local tEmail, tPassword, tUserA

ask "Please re-enter your password for security purposes."
put it into tPassword
put "cora@fakeemail.com" into tEmail

put cdb_readUserAccount(tEmail,tPassword,true) into tUserA

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
