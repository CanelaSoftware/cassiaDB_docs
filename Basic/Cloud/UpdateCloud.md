# UpdateCloud
---
```
command cdb_updateCloud pRecordA
```
## Summary:
This command makes changes to an existing cloud record without modifying the corresponding local record.

## Inputs:
* **`pRecordA`** *(Array)* - An array containing the cdbTableName, an an array of record IDs
    * `["cdbTableName"]` *(String)* - The specified table.
    * `["cdbRecordID"]` *(String)* - A single cdbRecordID, or a line-delimited list of cdbRecordIDs.

## Additional Requirements:
* This API call requires internet access.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
tRecordAlocal tRecordA
     
put fld "recordID" into tRecordA["cdbRecordID"]
put fld "firstName" into tRecordA["firstName"]
put fld "lastName" into tRecordA["lastName"]
put fld "age" into tRecordA["age"]
put fld "income" into tRecordA["income"]
put "clients" into tRecordA["cdbTableName"]
     
cdb_updateCloud tRecordA
```