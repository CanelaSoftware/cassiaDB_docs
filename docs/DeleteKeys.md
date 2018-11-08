# command cdb_deleteKeys pTable, pKeys, pRecordIDs, pTarget
---
## Summary
This command deletes specified keys from a record’s contents. Function may access multiple records from a table.

## Inputs
* **pTable** *(String)* - The name or tableID of the specified table.

* **pKeys** *(String)* - A comma delimited string where each item is a key to be deleted from the record. (**Do not include spaces between keys**)

* **pRecordIDs** *(String)* - A line delimited string where each line is the cdbRecordID of a record in the specified table.

* **pTarget** *(String)* - The place to create the record, either "cloud" or "local".

## Additional Requirements
This API call requires internet access to make cloud calls.

## Examples
```
local tTable, tKeys, tRecordIDs, tTarget

# Table name: clients
# Keys: firstName, lastName, age, income
# cdbRecordID: 87654321-abcd-1234-cdef-1234567890ab

put "clients" into tTable
put "age,income" into tKeys
put "87654321-abcd-1234-cdef-1234567890ab" into tRecordIDs
put "cloud" into tTarget
     
cdb_deleteKeys tTable,tKeys,tRecordIDs,tTarget
```
