# command cdb_logout pTarget

---
## Summary
This command logs the user account out of the system by removing authentication for that user.

## Inputs
* **pTarget** *(String)* - The value must be "user" to log out user accounts.


## Additional Requirements
This API call requires internet access.


## Examples
```livecodeserver
# We want to log out a user account.

local tTarget

put "user" into tTarget

cdb_logout tTarget
```