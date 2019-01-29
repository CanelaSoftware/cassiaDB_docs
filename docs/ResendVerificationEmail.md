# command cdb_resendVerificationEmail pEmail, pPassword, pType
---

## Summary
This command will resend the email that contains the link to verify newly created accounts.

## Inputs
* **pEmail** *(String)* - The email of the account to resend the email to.
* **pPassword** *(String)* - The password of the account.
* **pType** *(String)* - The account type to resend the email to, either "developer" or "user".

## Additional Requirements
This API call requires internet access.

## Examples
```livecodeserver
local tEmail, tPassword, tType

put "bob@mycompany.com" into tEmail
put "bobscompany" into tPassword
put "developer" into tType

cdb_resendVerificationEmail tEmail,tPassword,tType
``` 