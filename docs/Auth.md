# function cdb_auth(pEmail, pPassword, pTarget)

---
## Summary
This function authenticates a user account and returns an API key.

## Inputs
* **pEmail** *(String)* - The email of the account to authenticate.
* **pPassword** *(String)* - The password of the account to authenticate.
* **pTarget** *(String)* - The value must be "user" to authenticate user accounts.


## Additional Requirements
This API call requires internet access.


## Examples
```livecodeserver
# We want to authenticate a user account.

local tEmail, tPassword, tTarget

put "cora@fakeemail.com" into tEmail
put "corasfakeemail" into tPassword
put "user" into tTarget

get cdb_auth(tEmail,tPassword,tTarget)
```