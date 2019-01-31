# command cdb_logout pTarget

---
## Summary
This command logs the developer or user account out of the system.

## Inputs
* **pTarget** *(String)* - The account type to log out, either "developer" or "user".


## Additional Requirements
This API call requires internet access.


## Examples
### Example 1:
```livecodeserver
# We want to log out a developer account.

local tTarget

put "developer" into tTarget

cdb_logout tTarget
```
### Example 2:
```livecodeserver
# We want to log out a user account.

local tTarget

put "user" into tTarget

cdb_logout tTarget
```