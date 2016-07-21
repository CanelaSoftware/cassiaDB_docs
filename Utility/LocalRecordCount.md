# cdb_localRecordCount
---
```
function cdb_localRecordCount(tTableName)
```
## Summary:
This function counts the number of unique records in a given table.

## Inputs:
* **`tTableName`** *(String)* - The label of the table to access.

## Outputs:
(String) – Contains the numeric count of records in a given table.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tCount

put cdb_localRecordCount("clients") into tCount
```