# function cdb_getTableKeys(pInputA)
---

## Summary:
This function takes a table name and returns a comma-separated list of the keys of that table.

## Inputs:
* **`pInputA`** *(Array)* - An array that specifies the table name
	* `["cdbTableName"]` *(String)* - The specified table name.

## Outputs:
(String) - A comma-separated list of the keys in the table.

## API Version:
* `0.3` - Introduced

## Examples:
```
#Table "clients" has the following keys:
#firstname, lastname, age, income

local tInputA

put "clients" into tInputA["cdbTableName"]
    
put cdb_getTableKeys(tInputA)
#outputs "firstname,lastname,age,income"
``` 