# command cdb_updateLocal pInputA
---
## Summary:
This command makes changes to a local record, without making changes to the corresponding cloud record.

## Inputs:
* **`pInputA`** *(Array)* - An array of keys containing data per the following format:
    * `["cdbTableName"]` *(String)* - The specified table name.
    * `["cdbRecordID"]` *(String)* - A single cdbRecordID.
    * `[`*`yourKey1`*`]` *(String)* - User-defined key, where *yourKey1* is an arbitrary String for the key name. User must provide at least one self-defined key.
    * `*[`*`yourKeyN`*`]` *(String)* - User-defined key, where *yourKeyN* is an arbitrary String for the key name. User may provide more than one if desired.

## API Version:
* `0.3` - Introduced

## Examples:
```
local tInputA

#Table name: clients
#Schema: firstName, lastName, age, income

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