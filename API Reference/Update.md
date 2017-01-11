# command cdb_update pInputA
---
## Summary:
This command makes changes to an existing record.

## Inputs:
* **`pInputA`** *(Array)* - An array with the following format:
    * `["cdbTableName"]` *(String)* - The specified table name.
    * `["cdbTarget"]` *(String)* - The place to update the record, either `"cloud"` or `"local"`.
    * `["cdbRecordID"]` *(String)* - A single cdbRecordID.
    * `[`*`yourKey1`*`]` *(String)* - A Key as defined by the table's schema ([see getTableKeys](./cdb_getTableKeys.md)). User must provide at least one key.
    * `*[`*`yourKeyN`*`]` *(String)* - A Key as defined by the table's schema ([see getTableKeys](./cdb_getTableKeys.md)).

## Additional Requirements:
* This API call requires internet access.

## API Version:
* `0.3.0` - Introduced

## Examples:
```
local tInputA

#Table name: clients
#Keys: firstName, lastName, age, income

#Set up
put "clients" into tInputA["cdbTableName"]
put "cloud" into tInputA["cdbTarget"]   
put "123456abcdef" into tInputA["cdbRecordID"]

#One or more keys
put "Tom" into tInputA["firstName"]
put "Jerry" into tInputA["lastName"]
put "31" into tInputA["age"]
put "31000" into tInputA["income"]
     
cdb_update tInputA
```