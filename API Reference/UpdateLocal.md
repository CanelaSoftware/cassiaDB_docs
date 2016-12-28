# command cdb_updateLocal pInputA
---
## Summary:
This command makes changes to a local record, without making changes to the corresponding cloud record.

## Inputs:
* **`pInputA`** *(Array)* - An array of keys containing data per the following format:
    * `["cdbTableName"]` *(String)* - The specified table name.
    * `["cdbRecordID"]` *(String)* - A single cdbRecordID.
    * `[`*`yourKey1`*`]` *(String)* - A Key as defined by the table's schema ([see getTableKeys](./cdb_getTableKeys.md)). User must provide at least one key.
    * `*[`*`yourKeyN`*`]` *(String)* - A Key as defined by the table's schema ([see getTableKeys](./cdb_getTableKeys.md)).
## API Version:
* `0.3.0` - Introduced

## Examples:
```
local tInputA

#Table name: clients
#Keys: firstName, lastName, age, income

#Set up
put "clients" into tInputA["cdbTableName"]     
put "123456abcdef" into tInputA["cdbRecordID"]

#One or more keys
put "Tom" into tInputA["firstName"]
put "Jerry" into tInputA["lastName"]
put "31" into tInputA["age"]
put "31000" into tInputA["income"]
     
cdb_updateLocal tInputA
```