# command cdb_update pDataA, pTable, pRecordID, pTarget
---
## Summary
This command makes changes to an existing record.

## Inputs
* **pDataA** *(Array)* - An array with the following format:
    * [*keyName 1*] *(String)* - A key as defined by the table's schema ([see TableKeys](./TableKeys.md)). User must provide at least one key.
		* value - The new value for the corresponding key.
    * \*[*keyName N*] *(String)* - A key as defined by the table's schema.
    	* value - The new value for the corresponding key.
* **pTable** *(String)* - The name or tableID of the specified table.
* **pRecordID** *(String)* - The cdbRecordID of the record being updated.
* **pTarget** *(String)* - The place to update the record, either "cloud" or "local".

> \* _optional parameter_.

![UpdateInput](images/UpdateInput.svg)

## Additional Requirements
* This API call requires internet access in order to update cloud.

## Examples
```livecodeserver
local tDataA, tTable, tRecordID, tTarget

# Table name: clients
# Keys: firstName, lastName, age, income
# cdbRecordID: 12345678-abcd-1234-cdef-1234567890ab

# One or more keys
put "48" into tDataA["age"]
put "110000" into tDataA["income"]

put "clients" into tTable
put "12345678-abcd-1234-cdef-1234567890ab" into tRecordID
put "cloud" into tTarget 
     
cdb_update tDataA,tTable,tRecordID,tTarget
```