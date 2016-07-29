# cdb_getTableKeys
---
```
function cdb_getTableKeys(tInputA)
```

## Summary:
This function takes a table name and returns a comma-separated list of the keys of that table.

## Inputs:
* **`tInputA`** *(Array)* - An array that includes the table name
	* `["cdbTableName"]` *(String)* - The specified table name

## Outputs:
(String) - A comma-separated list of the keys in the table.

## API Version:
* `0.3.1` - Introduced

## Examples:
```  
local tInputA, tKeys

put "clients" into tInputA["cdbTableName"]
    
put cdb_getTableKeys(tInputA) into tKeys
-- tKeys now contains "firstname,lastname,age,income"
``` 