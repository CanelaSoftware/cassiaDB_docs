# cdb_cloudRecordCount
---
```
function cdb_cloudRecordCount(tTableName)
```
## Summary:
This function counts the number of cloud records in a given table.

## Inputs:
* **`tTableName`** *(String)* - The label of the table to access.

## Outputs:
(String) – Contains the numeric count of records in a given table on the cloud.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tCount

put cdb_cloudRecordCount("clients") into tCount
```