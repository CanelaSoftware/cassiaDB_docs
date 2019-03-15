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

put "12345678-abcd-1234-cdef-1234567890ab" into tTableID
cdb_tableName(tTableID)

# Output: clients
```
