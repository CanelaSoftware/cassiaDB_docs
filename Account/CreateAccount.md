# command cdb_createAccount pInputA
---
## Summary:
This command will create you an account on the CassiaDB account server. Once you have created an account, your configuration will be updated.

## Inputs:
* **`pInputA`** *(Array)* - An array of keys containing information to create the account per the following:
    * `["firstName"]` *(String)* - The specified first name of the user.
    * `["lastName]` *(String)* - The specified last name of the user.
    * `["email"]` *(String)* - Your email.
    * `["password"]` *(String)* - Your password.

## API Version:
* `0.3` - Introduced

## Examples:
```
local tInputA

put "mark@canelasoftware.com" into tInputA["email"]
put "myPassword" into tInputA["password"]
put "mark" into tInputA["firstName"]
put "talluto" into tInputA["lastName"]

cdb_createAccount tInputA
``` 