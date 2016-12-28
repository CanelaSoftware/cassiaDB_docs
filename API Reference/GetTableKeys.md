# function cdb_getTableKeys(pTableName, pTableID)
---

## Summary:
This function takes a table name or TableID and returns a comma-separated list of the keys of that table.

## Inputs:
* **`pTableName`** *(String)* - The table name.
* **`pTableID`** *(String)* - The table ID.

> _*Only one of the two parameters is required._

## Outputs:
(String) - A comma-separated list of the keys in the table.

## API Version:
* `0.3.0` - Introduced

## Examples:
```
#Table "clients", with ID "72a88e4f-c6ba-4fda-9381-2f0b0ca220bd" has the following keys:
#firstname, lastname, age, income
    
put cdb_getTableKeys("clients")
#outputs "firstname,lastname,age,income"

put cdb_getTableKeys(,"72a88e4f-c6ba-4fda-9381-2f0b0ca220bd")
#outputs "firstname,lastname,age,income"
``` 