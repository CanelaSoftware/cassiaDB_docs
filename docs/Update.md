# command cdb_update pDataA,pRecordID,pTable,pTarget
---
## Summary
This command makes changes to an existing record.

## Inputs
* **pDataA** *(Array)* - An array with the following format:
    * [*keyName 1*] *(String)* - A key as defined by the table's schema ([see getTableKeys](./GetTableKeys.md)). User must provide at least one key.
		* value - The new value for the corresponding key.
    
    * \*[*keyName N*] *(String)* - A key as defined by the table's schema.
    	* value - The new value for the corresponding key.

* **pRecordIDs** *(String)* - The cdbRecordID of the record being updated.

* **pTable** *(String)* - The name or tableID of the specified table.

* **pTarget** *(String)* - The place to udpate the record, either "cloud" or "local".

> \* optional parameter.

## Additional Requirements
* This API call requires internet access in order to update cloud.

## Examples
```
local tDataA, tTable, tRecordID, tTarget

# Table name: clients
# Keys: firstName, lastName, age, income
# cdbRecordID: 12345678-abcd-1234-cdef-1234567890ab

put "clients" into tTable
put "cloud" into tTarget 
put "12345678-abcd-1234-cdef-1234567890ab" tRecordID

# One or more keys
put "48" into tDataA["age"]
put "110000" into tDataA["income"]
     
cdb_update tDataA,tRecordID,tTable,tTarget
```