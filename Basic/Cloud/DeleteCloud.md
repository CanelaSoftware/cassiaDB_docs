# cdb_deleteCloud
---
```
command cdb_deleteCloud tInputA
```
## Summary:
This command deletes a record from a cloud table (but not from local).

## Inputs:
* **`tInputA`** *(Array)* - An array of keys containing data per the following format:
    * `["cdbTableName"]` *(String)* - The specified table name.
    * `["cdbRecordID"]` *(String)* - A single cdbRecordID.

## Additional Requirements:
This API call requires internet access.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tInputA
     
put fld "TableName" into tInputA["cdbTableName"]
put fld "recordID" into tInputA["cdbRecordID"]
     
cdb_deleteCloud tInputA
```