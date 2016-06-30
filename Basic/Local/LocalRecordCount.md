# cdb_localRecordCount
---
```
function cdb_localRecordCount(pTableName)
```
## Summary:
This function counts the number of unique records in a given database.

## Inputs:
* **`pTableName`** *(String)* - The label of the database to access.

## Outputs:
(String) – Contains the numeric count of records in a given database.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tCount

put cdb_localRecordCount("clients") into tCount
```