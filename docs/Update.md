# command cdb_update pDataA, pTable, pRecordID, pTarget, *pInternalA*
---
Updated 11/22/19
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
* \***pInternalA** *(Array)* - An array whose key is "delaySend" and its value is true. Optional parameter if pTarget is "cloud." This will delay processing the cloud call and will store its transaction in "cdbCache." Use [cdb_flushCache](FlushCache.md) to process the delayed transactions.

> \* _optional parameter_.

![UpdateInput](images/UpdateInput.svg)

## Additional Requirements
* This API call requires internet access in order to update cloud records.

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

```livecodeserver
local tDataA, tTable, tRecordID, tTarget, tInternalA

# Table name: office
# Keys: name, address
# cdbRecordID: 98778124-idfd-6544-efgf-8744532890po

# One or more keys
put "789 Tech Street" into tDataA["address"]

put "office" into tTable
put "98778124-idfd-6544-efgf-8744532890po" into tRecordID
put "cloud" into tTarget
put true into tInternalA["delaySend"]
     
cdb_update tDataA,tTable,tRecordID,tTarget,tInternalA

# Process the delayed transaction
cdb_flushCache
```