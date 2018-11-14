# function cdb_read(pTable, pRecordIDs, pTarget)
---
## Summary
This function reads one or more records from either local or cloud, and returns them as an array.

## Inputs
* **pTable** *(String)* - The name or tableID of the specified table.

* **pRecordIDs** *(String)* - A line delimited string where each line is the cdbRecordID of a record in the specified table.

* **pTarget** *(String)* - The place to read the record, either "cloud" or "local".
       
## Outputs
(Array) - One or more cdbRecordIDs with keys of the specified table. This includes a key "cdb", which holds [metadata](Metadata.md).

![ReadOutput](images/BasicOutput.svg)

## Additional Requirements
This API call requires internet access to make cloud calls.

## Examples
```livecodeserver
local tTable, tRecordIDs, tTarget, tOutputA

# Table name: clients
# Keys: firstName, lastName, age, income
# cdbRecordID: 12345678-abcd-1234-cdef-1234567890ab

put "12345678-abcd-1234-cdef-1234567890ab" into tRecordIDs
put "clients" into tTable
put "cloud" into tTarget
    
put cdb_read(tTable,tRecordIDs,tTarget) into tOutputA

# Output Array: 
# tOutputA["12345678-abcd-1234-cdef-1234567890ab"]["cdb"] - metadata
#						  ["firstName"] - value
#						  ["lastName"] - value
#						  ["age"] - value
#						  ["income"] - value
```