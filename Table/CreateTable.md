# cdb_createTable
---
```
command cdb_createTable tInputA
```

## Summary:
This command will create a table.

## Inputs:
* **`tInputA`** *(Array)* - An array of keys containing information to create the table.
    * `["cdbTableName"]` *(String)* - The specified table name to be created.
    * `["email"]` *(String)* - Your email.
    * `["password"]` *(String)* - Your password.
    * `["keys"]` *(String)* - The keys you want to define record on your table to abide by.


## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tInputA

put "mark@canelasoftware.com" into tInputA["email"]
put "myPassword" into tInputA["password"]
put "accounting" into tInputA["cdbTableName"]
put "income,taxes,gross,net" into tInputA["keys"]
cdb_createTable tInputA
``` 