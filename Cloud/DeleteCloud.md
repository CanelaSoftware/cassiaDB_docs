# cdb_deleteCloud
---
```
command cdb_deleteCloud pInputA
```
## Summary:
This command deletes a record from a cloud table (but not from local).

## Inputs:
* **`pInputA`** *(Array)* - An array of keys containing data per the following format:
    * `["cdbTableName"]` *(String)* - The specified table name.
    * `["cdbRecordID"]` *(String)* - A line delimited list of cdbRecordIDs.

## Additional Requirements:
This API call requires internet access.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tInputA
     
put "clients" into tInputA["cdbTableName"]
put "123456abcdef" into tInputA["cdbRecordID"]
     
cdb_deleteCloud tInputA
```