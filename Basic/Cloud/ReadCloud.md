# ReadCloud
---
```
function cdb_readCloud(pRecordA)
```
## Summary:
This function downloads the most recent version of a cloud record, and returns it as an array without updating the local record.

## Inputs:
* **`pRecordA`** *(Array)* - An array containing the cdbTableName, an an array of record IDs
    * `["cdbTableName"]` *(String)* - The specified table name
    * `["cdbRecordID"]` *(String)* - A single cdbRecordID, or a line-delimited list of cdbRecordIDs.

## Outputs:
(Array) – A record with keys as defined by the schema of the accessed database.

## Additional Requirements:
This API call requires internet access.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tRecordA, tDataA

put fld "recordID" into tRecordA["cdbRecordID"]
put "clients" into tRecordA["cdbTableName"]
    
put cdb_readCloud(tRecordA) into tDataA
```