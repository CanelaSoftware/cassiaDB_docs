# command cdb_deleteTable pInputA
---

## Summary:
This command will remove a table from the database. It will also delete all data from the table, both locally and on the cloud.

## Inputs:
* **`pInputA`** *(Array)* - An array containing the following:
    * `["cdbTableName"]` *(String)* - The specified table name to be deleted.
    * `["email"]` *(String)* - The email for the owner of the table.
    * `["password"]` *(String)* - The password for the owner of the table.

## API Version:
* `0.3` - Introduced

## Examples:
```
#Table "clients" is owned by user "test@canelasoftware.com"
#user's password is "abracadabra"

local tInputA

put "clients" into tInputA["tableName"]
put "test@canelasoftware.com" into tInputA["email"]
put "abracadabra" into tInputA["password"]

cdb_deleteTable tInputA
#Table "clients" no longer exists in the database.
``` 
