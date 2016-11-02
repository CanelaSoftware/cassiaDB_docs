# cdb_deleteLocal
---
```
command cdb_deleteLocal pInputA
```
## Summary:
This command deletes a record from a local table (but not from the cloud).

## Inputs:
* **`pInputA`** *(Array)* - An array of keys containing data per the following format:
    * `["cdbTableName"]` *(String)* - The specified table name.
    * `["cdbRecordID"]` *(String)* - A line delimited list of cdbRecordIDs.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tInputA
     
put "clients" into tInputA["cdbTableName"]
put "123456abcdef" into tInputA["cdbRecordID"]
     
cdb_deleteLocal tInputA
```