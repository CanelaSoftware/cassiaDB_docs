# cdb_createAccount
---
```
command cdb_createAccount tInputA
```

## Summary:
This command will create you an account on the CassiaDB account server. You must specify the keys for your first table, which will also be created. Once you have created an account, your configuration will be updated so your application will have access to your tables.

## Inputs:
* **`tInputA`** *(Array)* - An array of keys containing information to create the table per the following:
    * `["cdbTableName"]` *(String)* - The specified table name to be created.
    * `["email"]` *(String)* - Your email.
    * `["password"]` *(String)* - Your password.
    * `["keys"]` *(String)* - The keys you want your table to have. Minimum of one key is required.
   		- `[`*`yourKey1`*`]` - user defined key(s) to store data in records on your table.
    	- `[`*`yourKeyN`*`]` - user defined key(s) to store data in records on your table.

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