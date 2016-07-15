# cdb_deleteLocal
---
```
command cdb_deleteLocal tInputA
```
## Summary:
This command deletes a record from the local database only.

## Inputs:
* **`tInputA`** *(Array)* - An array of keys containing the cdbTableName, and one or more cdbRecordIDs. Here are the choices for key names:
    * `["cdbTableName"]` *(String)* - The specified table name.
    * `["cdbRecordID"]` *(String)* - A single cdbRecordID, or a line-delimited list of cdbRecordIDs.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tInputA
     
put fld "TableName" into tInputA["cdbTableName"]
put fld "recordID" into tInputA["cdbRecordID"]
     
cdb_deleteLocal tInputA
```