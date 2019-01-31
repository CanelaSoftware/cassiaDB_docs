# function cdb_auth(pEmail, pPassword, pTarget)

---
## Summary
This function authenticates an account as either a developer or a user and returns an API key.

## Inputs
* **pEmail** *(String)* - The email of the account to authenticate.
* **pPassword** *(String)* - The password of the account to authenticate.
* **pTarget** *(String)* - The account type to authenticate, either "developer" or "user".


## Additional Requirements
This API call requires internet access.


## Examples
###Example 1:
```livecodeserver
# We want to authenticate a developer account.

local tEmail, tPassword, tTarget

put "bob@mycompany.com" into tEmail
put "bobscompany" into tPassword
put "developer" into tTarget

get cdb_auth(tEmail,tPassword,tTarget)
```
### Example 2:
```livecodeserver
# We want to authenticate a user account.

local tEmail, tPassword, tTarget

put "cora@fakeemail.com" into tEmail
put "corasfakeemail" into tPassword
put "user" into tTarget

get cdb_auth(tEmail,tPassword,tTarget)
```