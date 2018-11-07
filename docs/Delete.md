# command cdb_delete pTable,pRecordIDs,pTarget
---
## Summary
This command deletes one or more records from the table.

## Inputs
* **pTable** *(String)* - The name or tableID of the specified table.

* **pRecordIDs** *(String)* - A line delimited string where each line is the cdbRecordID of a record to be deleted in the specified table

* **pTarget** *(String)* - The place to delete the record, either "cloud" or "local".

## Additional Requirements
This API call requires internet access in order to delete cloud records.

## Examples
```
local tTable, tRecordIDs, tTarget

# Table name: clients
# Keys: firstName, lastName, age, income
# cdbRecordID: 123456abcdef

put "clients" into tTable
put "123456abcdef" into tRecordIDs
put "cloud" into tTarget
     
cdb_delete tTable,tRecordIDs,tTarget
```