# cdb_createAccount
---
```
command cdb_createAccount tInputA
```

## Summary:
This command will create you an account on the CassiaDB account server. You must specify the keys for your first table, which will also be created. Once you have created an account, your configuration will be updated so your application will have access to your tables.

## Inputs:
* **`tInputA`** *(Array)* - An array of keys containing information to create the table per the following:
    * `["firstName"]` *(String)* - The specified first name of the user.
    * `["lastName]` *(String)* - The specified last name of the user.
    * `["email"]` *(String)* - Your email.
    * `["password"]` *(String)* - Your password.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tInputA

put "mark@canelasoftware.com" into tInputA["email"]
put "myPassword" into tInputA["password"]
put "mark" into tInputA["firstName"]
put "talluto" into tInputA["lastName"]
cdb_createAccount tInputA
``` 