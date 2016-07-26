# cdb_localCount
---
```
function cdb_localCount(tTableName)
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

put cdb_localCount("clients") into tCount
```