# command cdb_updateUserAccount pDataA, pProjectName, pEmail

---
## Summary
This command updates a user account record in the cdbUsers table for a specific project.

## Inputs
* **pDataA** *(Array)* - An array with the following format:
	* [*keyName 1*] *(String)* - A key as defined by the cdbUsers table's schema. User must provide at least one key.
		* value - The new value for the corresponding key.
	* [*keyName N*] *(String)* - A key as defined by the cdbUsers table's schema.
* **pProjectName** *(String)* - The name of the project to update the user account record from.
* **pEmail** *(String)* - The email associated with the user's account.

![UpdateUserAccountInput](images/UpdateUserAccountInput.svg)


## Additional Requirements
This API call requires internet access.


## Examples
```livecodeserver
# Project Name: meetings

local tDataA, tProjectName, tEmail

put "meetings" into tProjectName
put "cora@fakeemail.com" into tEmail

# One or more keys
put "Coraline" into tDataA["firstName"]

cdb_updateUserAccount tDataA,tProjectName,tEmail
```
