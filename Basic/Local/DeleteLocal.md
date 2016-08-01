# cdb_deleteLocal
---
```
command cdb_deleteLocal tInputA
```
## Summary:
This command deletes a record from a local table (but not from the cloud).

## Inputs:
* **`tInputA`** *(Array)* - An array of keys containing data per the following format:
    * `["cdbTableName"]` *(String)* - The specified table name.
    * `["cdbRecordID"]` *(String)* - A single cdbRecordID.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tInputA
     
put fld "TableName" into tInputA["cdbTableName"]
put fld "recordID" into tInputA["cdbRecordID"]
     
cdb_deleteLocal tInputA
```