# cdb_deleteCloud
---
```
command cdb_deleteCloud tRecordID, tTableName
```
## Summary:
This command deletes one or more records from the cloud database.

## Inputs:
* **`tInputA`** *(Array)* - An array of keys containing the cdbTableName, and one or more cdbRecordIDs. Here are the choices for key names:
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