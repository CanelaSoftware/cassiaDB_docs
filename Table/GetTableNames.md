# function cdb_getTableNames(pInputA)
---
## Summary:
This function returns the table name of a specified TableID, or all table names if no ID is provided.

## Inputs:
* **`pInputA`** *(Array)* - An array that specifies the table ID
	* *`["cdbTableName"]` *(String)* - The specified table name. (Optional)
	
## Outputs:
*(String)* – The table name, or a line-delimited list of all table names.

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
