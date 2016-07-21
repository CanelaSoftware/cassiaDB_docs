# cdb_getTableNames
---
```
function cdb_getTableNames tInputA
```
## Summary:
This function returns all the table names for a team ID.

## Outputs:
*(String)* – The names of the tables, or empty if no table has been defined.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tTableName
     
put cdb_getTableNames into tTableName
```
