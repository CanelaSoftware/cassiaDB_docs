# function cdb_authStatus()

---
## Summary
This function returns the current authentication status.

## Outputs
* *(Bool)* - False if no account has been authenticated.
* *(Array)* - An array with the keys "cloud" and "local" and whose values are true or false.


## Examples
```livecodeserver
# We want to check the authentication status of an authenticated user.

local tAuthStatus

put cdb_authStatus() into tAuthStatus

# Output: tAuthStatus["cloud"] - true
#					 ["local"] - true
```