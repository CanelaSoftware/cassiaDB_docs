# function cdb_tableName(pTableID)
---
## Summary
This function takes a tableID and returns the name of that table.

## Inputs
* **pTableID** *(String)* - A tableID.
	
## Outputs
*(String)* – The table name of the specified tableID.

## Examples
```livecodeserver
local tTableID

put "72a88e4f-c6ba-4fda-9381-2f0b0ca220bd" into tTableID
get cdb_tableName(tTableID)

# Output: clients
```
