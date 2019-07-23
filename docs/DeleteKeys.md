# command cdb_deleteKeys pTable, pRecordIDs, pKeys, pTarget
---
## Summary
This command deletes specified keys from a record’s contents. Function may access multiple records from a table.

## Inputs
* **pTable** *(String)* - The name or tableID of the specified table.

* **pRecordIDs** *(String)* - A line delimited string where each line is the cdbRecordID of a record in the specified table.

* **pKeys** *(String)* - A comma delimited string where each item is a key to be deleted from the record. (**Do not include spaces between keys**)

* **pTarget** *(String)* - The place of the record whose keys you want to delete, either "cloud" or "local".

## Additional Requirements
This API call requires internet access to make cloud calls.

## Examples
```livecodeserver
local tTable, tRecordIDs, tKeys, tTarget

# Table name: clients
# Keys: firstName, lastName, age, income
# cdbRecordID: 87654321-abcd-1234-cdef-1234567890ab

put "clients" into tTable
put "87654321-abcd-1234-cdef-1234567890ab" into tRecordIDs
put "age,income" into tKeys
put "cloud" into tTarget
     
cdb_deleteKeys tTable,tRecordIDs,tKeys,tTarget
```
