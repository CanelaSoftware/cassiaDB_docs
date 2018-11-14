# function cdb_tableKeys(pTable)
---

## Summary
This function takes a table name or TableID and returns a comma-separated list of the keys of that table.

## Inputs
* **pTable** *(String)* - The TableID or TableName whose keys should be returned.

## Outputs
(String) - A comma-separated list of the keys in the table.


## Examples
```livecodeserver
# Table "clients", with ID "72a88e4f-c6ba-4fda-9381-2f0b0ca220bd" has the following keys:
#firstname, lastname, age, income
    
put cdb_tableKeys("clients")
#outputs "firstname,lastname,age,income"

put cdb_tableKeys("72a88e4f-c6ba-4fda-9381-2f0b0ca220bd")
#outputs "firstname,lastname,age,income"
```