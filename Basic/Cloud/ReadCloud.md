# cdb_readCloud
---
```
function cdb_readCloud(tInputA)
```
## Summary:
This function downloads the most recent version of a cloud record, and returns it as an array without updating the local record.

## Inputs:
* **`tInputA`** *(Array)* - An array of keys containing data per the following format:
    * `["cdbTableName"]` *(String)* - The specified table name
    * `["cdbRecordID"]` *(String)* - A single cdbRecordID

## Outputs:
(Array) – A record with keys as defined by the schema of the accessed database.

![Read output diagram](../../chartimages/ReadOutputSingle.png)

## Additional Requirements:
This API call requires internet access.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tInputA, tDataA

put fld "recordID" into tInputA["cdbRecordID"]
put "clients" into tInputA["cdbTableName"]
    
put cdb_readCloud(tInputA) into tDataA
```