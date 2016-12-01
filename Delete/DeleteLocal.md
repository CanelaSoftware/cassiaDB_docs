# command cdb_deleteLocal pInputA
---
## Summary:
This command deletes one or more record(s) from the local table (but not from the cloud).

## Inputs:
* **`pInputA`** *(Array)* - An array of keys containing data per the following format:
    * `["cdbTableName"]` *(String)* - The specified table name.
    * `["cdbRecordID"]` *(String)* - A single cdbRecordID or a line delimited list of cdbRecordIDs.

## API Version:
* `0.3` - Introduced

## Examples:
```
local tInputA

#Table name: clients
#Keys: firstName, lastName, age, income
#A single cdbRecordID: 123456abcdef

put "clients" into tInputA["cdbTableName"]
put "123456abcdef" into tInputA["cdbRecordID"]
     
cdb_deleteLocal tInputA
```