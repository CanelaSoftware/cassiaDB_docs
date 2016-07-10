# cdb_readLocal
---
```
function cdb_readLocal(pRecordA)
```
## Summary:
This function reads a local record and returns that record’s contents.

## Inputs:
* **`pRecordA`** *(Array)* - An array of keys containing the cdbTableName, and one or more cdbRecordIDs. Here are the choices for key names:
    * `["cdbTableName"]` *(String)* - The specified table name.
    * `["cdbRecordID"]` *(String)* - A single cdbRecordID, or a line-delimited list of cdbRecordIDs.

## Outputs:
(Array) – A record with keys as defined by the schema of the accessed database.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tRecordA, tDataA
     
put fld "recordID" into tRecordA["cdbRecordID"]
put "clients" into tRecordA["cdbTableName"]
     
put cdb_readLocal(tRecordA) into tDataA
```