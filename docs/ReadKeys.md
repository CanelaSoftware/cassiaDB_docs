# function cdb_readKeys(pTable, pKeys, pRecordIDs, pTarget)
---
## Summary
This function reads record(s) and returns only the keys requested from a record’s contents. Function may access multiple records from a table.

## Inputs
* **pTable** *(String)* - The name or tableID of the specified table.

* **pKeys** *(String)* - A comma delimited string where each item is a requested key of the record. (**Do not include spaces between keys**)

* **pRecordIDs** *(String)* - A line delimited string where each line is the cdbRecordID of a record in the specified table.

* **pTarget** *(String)* - The place to create the record, either "cloud" or "local".

## Outputs
(Array) – One or more cdbRecordIDs containing a partial record with only the keys requested in the input.

## Additional Requirements
This API call requires internet access to make cloud calls.

## Examples
```livecodeserver
local tTable, tKeys, tRecordIDs, tTarget, tOutputA

# Table name: clients
# Keys: firstName, lastName, age, income
# cdbRecordID: 87654321-abcd-1234-cdef-1234567890ab

put "clients" into tTable
put "age,income" into tKeys
put "87654321-abcd-1234-cdef-1234567890ab" into tRecordIDs
put "cloud" into tTarget
     
put cdb_readKeys(tTable,tKeys,tRecordIDs,tTarget) into tOutputA

# Output Array:
# tOutputA["87654321-abcd-1234-cdef-1234567890ab"]["age"] - 46
# tOutputA["87654321-abcd-1234-cdef-1234567890ab"]["income"] - 100000
```
