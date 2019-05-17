# function cdb_loggedInUser()
---
## Summary
This function returns the email of the logged in user (or developer), if there is one that has been authed. If no user is logged in/authed, then it returns empty.

## Inputs
None

## Outputs
*(String)* - The email of the logged in user

## Examples
```livecodeserver
get cdb_auth("user@email.com","password","user")
# Assuming successful log in.

put cdb_loggedInUser()

# Output: user@email.com
```