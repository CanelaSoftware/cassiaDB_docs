# cdb_createAccount
---
```
command cdb_createAccount tInputA
```

## Summary:
This command will create you an account.

## Inputs:
* **`tInputA`** *(Array)* - An array of keys containing information to create the table.
    * `["cdbTableName"]` *(String)* - The specified table name to be created.
    * `["email"]` *(String)* - Your email.
    * `["password"]` *(String)* - Your password.
    * `["keys"]` *(String)* - The keys you want to define record on your table to abide by.
    * `[`*`yourKey 1`*`]` - user defined keys to store data in records on your table.
    * `[`*`yourKey N`*`]` - user defined keys to store data in records on your table.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tInputA

put "mark@canelasoftware.com" into tInputA["email"]
put "myPassword" into tInputA["password"]
put "clients" into tInputA["cdbTableName"]
put "mark" into tInputA["firstName"]
put "talluto" into tInputA["lastName"]
put "firstName,lastName,age,income" into tInputA["keys"]
cdb_createAccount tInputA
``` 