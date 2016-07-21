# cdb_getSchema
---
```
function cdb_getSchema tInputA
```

## Summary:
This function returns the schema for a specified database

## Inputs:
* **`tInputA`** *(Array)* - An array of one key containing the cdbTableName.
    * `["cdbTableName"]` *(String)* - The specified table name to get the schema for.

## Outputs:
*(String)* – A line-delimited list of the keys for the specified database.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tInputA

put fld "workingTableName data" into tInputA["cdbTableName"]
put "Schema:" & lf & cdb_getSchema(tInputA) & lf & lf after fld "data"
```