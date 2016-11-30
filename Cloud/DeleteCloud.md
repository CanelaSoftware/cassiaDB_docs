# command cdb_deleteCloud pInputA
---
## Summary:
This command deletes one or more record(s) from the cloud table (but not from local).

## Inputs:
* **`pInputA`** *(Array)* - An array of keys containing data per the following format:
    * `["cdbTableName"]` *(String)* - The specified table name.
    * `["cdbRecordID"]` *(String)* - A single cdbRecordID or a line delimited list of cdbRecordIDs.

## Additional Requirements:
This API call requires internet access.

## API Version:
* `0.3` - Introduced

## Examples:
```
local tInputA

#Table name: clients
#Schema: firstName, lastName, age, income
#A single cdbRecordID: 123456abcdef

put "clients" into tInputA["cdbTableName"]
put "123456abcdef" into tInputA["cdbRecordID"]
     
cdb_deleteCloud tInputA
```