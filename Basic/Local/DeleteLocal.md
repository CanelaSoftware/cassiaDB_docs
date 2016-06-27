# DeleteLocal
---
```
command cdb_deleteLocal pRecordA
```
## Summary:
This command deletes a record from the local database only.

## Inputs:
* **`pRecordA`** *(Array)* - An array containing the cdbTableName, an an array of record IDs
    * `["cdbTableName"]` *(String)* - The specified table name.
    * `["cdbRecordID"]` *(String)* - A single cdbRecordID, or a line-delimited list of cdbRecordIDs.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tRecordA
     
put fld "TableName" into tRecordA["cdbTableName"]
put fld "recordID" into tRecordA["cdbRecordID"]
     
cdb_deleteLocal tRecordA
```