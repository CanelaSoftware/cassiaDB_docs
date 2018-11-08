# function cdb_teamID(pTable)
---
## Summary
This function returns the team ID that owns a given table. Team IDs representing your LiveCloud account.

## Inputs
* \* **pTable** *(String)* - the table name or table ID. If this is empty, your active team ID will be returned.

> \* _optional parameter_

## Outputs
(String) - The team ID.

## Examples
```
put cdb_teamID()

# Output: 9fe03fc8-ef46-4835-bda6-bf58be273964

put cdb_teamID("clients")

# Output: 9fe03fc8-ef46-4835-bda6-bf58be273964
``` 