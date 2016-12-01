# command cdb_createTable pInputA
---

## Summary:
This command will create a table with specified keys.

## Inputs:
* **`pInputA`** *(Array)* - An array containing the following:
    * `["tableName"]` *(String)* - The table name to be created
    * `["keys"]` *(String)* - The keys for the table
    * `["email"]` *(String)* - User's email
    * `["password"]` *(String)* - User's password


## API Version:
* `0.3` - Introduced

## Examples:
```
#User "mark@canelasoftware.com"
#Password "myPassword"

local tInputA

put "mark@canelasoftware.com" into tInputA["email"]
put "myPassword" into tInputA["password"]
put "accounting" into tInputA["tableName"]
put "income,taxes,gross,net" into tInputA["keys"]

cdb_createTable tInputA
#Table "accounting" has been created
#with keys "income", "taxes", "gross", and "net"
``` 