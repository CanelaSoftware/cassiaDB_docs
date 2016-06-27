# DeleteCloud
---
```
command cdb_deleteCloud pRecordID, pTableName
```
## Summary:
This command deletes one or more records from the cloud database.

## Inputs:
* **`pRecordA`** *(Array)* - An array containing the cdbTableName, an an array of record IDs
    * `["cdbTableName"]` *(String)* - The specified table name.
    * `["cdbRecordID"]` *(String)* - A single cdbRecordID, or a line-delimited list of cdbRecordIDs.

## Additional Requirements:
This API call requires internet access.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tRecordID,TableName

put fld "TableName" into tTableName
put fld "recordID" into tRecordID

cdb_deleteCloud tRecordID,tTableName
```