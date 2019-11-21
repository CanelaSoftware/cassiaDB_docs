# command cdb_delete pTable, pRecordIDs, pTarget, *pInternalA*
---
## Summary
This command deletes one or more records from the table.

## Inputs
* **pTable** *(String)* - The name or tableID of the specified table.

* **pRecordIDs** *(String)* - A line delimited string where each line is the cdbRecordID of a record to be deleted in the specified table

* **pTarget** *(String)* - The place to delete the record, either "cloud" or "local".

* \***pInternalA** *(Array)* - An array whose key is "delaySend" and its value is true. Optional parameter if pTarget is "cloud." This will delay processing the cloud call and will store its transaction in "cdbCache." Use [cdb_flushCache](FlushCache.md) to process the delayed transactions.

> _*optional parameter._

## Additional Requirements
This API call requires internet access in order to delete cloud records.

## Examples
```livecodeserver
local tTable, tRecordIDs, tTarget

# Table name: clients
# Keys: firstName, lastName, age, income
# cdbRecordID: 12345678-abcd-1234-cdef-1234567890ab

put "clients" into tTable
put "12345678-abcd-1234-cdef-1234567890ab" into tRecordIDs
put "cloud" into tTarget
     
cdb_delete tTable,tRecordIDs,tTarget
```

```livecodeserver
local tTable, tRecordIDs, tTarget, tInternalA

# Table name: office
# Keys: name, address
# cdbRecordID: 98778124-idfd-6544-efgf-8744532890po

put "office" into tTable
put "98778124-idfd-6544-efgf-8744532890po" into tRecordIDs
put "cloud" into tTarget
put true into tInternalA["delaySend"]

cdb_delete tTable,tRecordIDs,tTarget,tInternalA

# Process the delayed transaction
cdb_flushCache
```