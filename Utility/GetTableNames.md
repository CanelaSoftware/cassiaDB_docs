# function cdb_getTableNames()
---
## Summary:
This function returns all table names.

## Outputs:
*(String)* – A line-delimited list of all table names.

## API Version:
* `0.3` - Introduced

## Examples:
```
local tTableNames
     
put cdb_getTableNames() into tTableNames

#Output: clients
		 orders
		 employees
```
