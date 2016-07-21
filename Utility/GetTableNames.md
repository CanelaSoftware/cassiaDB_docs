# cdb_getTableNames
---
```
function cdb_getTableNames
```
## Summary:
This function returns all the table names in an account.

## Outputs:
*(String)* – A line-delimited list of the table names in an account. 

## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tTableName
     
put cdb_getTableNames into tTableName
```
