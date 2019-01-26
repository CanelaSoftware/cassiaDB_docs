# function cdb_tableID(pTableName)
---

## Summary
This function takes a table name and returns the ID of that table.

## Inputs
* **pTableName** *(String)* - The name of the table.

## Outputs
*(String)* - The Table ID of the specified table. If the table does not exist, **empty** will be returned.

## Examples
```livecodeserver
# Table "clients" which has tableID "72a88e4f-c6ba-4fda-9381-2f0b0ca220bd"

put cdb_tableID("clients")

# outputs "72a88e4f-c6ba-4fda-9381-2f0b0ca220bd"
``` 