# function cdb_getTableID(pTableName)
---

## Summary
This function takes a table name and returns the ID of that table.

## Inputs
* **`tTableName`** *(String)* - The name of the table.

## Outputs
(String) - The Table ID of the specified table.

## API Version
* `0.3.0` - Introduced

## Examples
```
# Table "customers" which has tableID "72a88e4f-c6ba-4fda-9381-2f0b0ca220bd"

put cdb_getTableID("customers")

# outputs "72a88e4f-c6ba-4fda-9381-2f0b0ca220bd"
``` 