# UpdateLocal
---
```
command cdb_updateLocal pRecordA
```
## Summary:
This command makes changes to a local record, without making changes to the corresponding cloud record.

## Inputs:
* **`pRecordA`** *(Array)* - An array containing the cdbTableName, an an array of record IDs
    * `["cdbTableName"]` *(String)* - The specified table name.
    * `["cdbRecordID"]` *(String)* - A single cdbRecordID, or a line-delimited list of cdbRecordIDs.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tRecordA,tRecordID
     
put fld "recordID" into tRecordA["cdbRecordID"]
put fld "firstName" into tRecordA["firstName"]
put fld "lastName" into tRecordA["lastName"]
put fld "age" into tRecordA["age"]
tRecordAput fld "income" into tRecordA["income"]
put "clients" into tRecordA["cdbTableName"]
     
cdb_updateLocal tRecordA
```