# function cdb_create(pDataA, pTable, pTarget, *pInternalA*)
---
## Summary
This function allocates a new cdbRecordID for a record in either the cloud or locally, storing the provided data.

## Inputs
* **pDataA** *(Array)* - An array with the following format:
	* [*keyName 1*] *(String)* - A key as defined by the table's schema ([see TableKeys](./TableKeys.md)). User must provide at least one key.
		* value - The value for the corresponding key.

    * \*[*keyName N*] *(String)* - A key as defined by the table's schema.
    	* value - The value for the corresponding key.

* **pTable** *(String)* - The name or tableID of the specified table.

* **pTarget** *(String)* - The place to create the record, either "cloud" or "local".

* \***pInternalA** *(Array)* - An array whose key is "delaySend" and its value is true. Optional parameter if pTarget is "cloud." This will delay processing the cloud call and will store its transaction in "cdbCache." Use [cdb_flushCache](FlushCache.md) to process the delayed transactions.

> _*optional parameter._

![Create input diagram](images/CreateInput.svg)

## Outputs
*(String)* - The allocated cdbRecordID for the new record.

## Additional Requirements
This API call requires internet access in order to create cloud records.

## Examples
```livecodeserver
local tDataA, tTable, tTarget

# Table name: clients
# Keys: firstName, lastName, age, income

put "John" into tDataA["firstName"]
put "Smith" into tDataA["lastName"]
put "47" into tDataA["age"]
put "100000" into tDataA["income"]
put "clients" into tTable
put "cloud" into tTarget

put cdb_create(tDataA,tTable,tTarget) into tRecordID
# tRecordID now contains the cdbRecordID of the created record: 12345678-abcd-1234-cdef-1234567890ab

# Error handling
if not cdb_result() then
	answer cdb_result("response")
end if
```

```livecodeserver
local tDataA, tTable, tTarget, tInternalA

# Table name: clients
# Keys: firstName, lastName, age, income

put "Cora" into tDataA["firstName"]
put "Doe" into tDataA["lastName"]
put "35" into tDataA["age"]
put "100000" into tDataA["income"]
put "clients" into tTable
put "cloud" into tTarget
put true into tInternalA["delaySend"]

put cdb_create(tDataA,tTable,tTarget,tInternalA) into tRecordID
# tRecordID now contains the cdbRecordID of the created record: 32165478-wxyz-7890-cdef-6544567890ty

# Error handling
if not cdb_result() then
	answer cdb_result("response")
end if

# Process the delayed transaction
cdb_flushCache
```