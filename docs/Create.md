# function cdb_create(pDataA, pTable, pTarget)
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

![Create input diagram](images/CreateInput.svg)

## Outputs
(String) - The allocated cdbRecordID for the new record.

## Additional Requirements
This API call requires internet access in order to create cloud records.

## Examples
```
local tDataA, tTable, tTarget

# Table name: clients
# Keys: firstName, lastName, age, income

put "John" into tDataA["firstName"]
put "Doe" into tDataA["lastName"]
put "20" into tDataA["age"]
put "30000" into tDataA["income"]
put "clients" into tTable
put "cloud" into tTarget

put cdb_create(tDataA,tTable,tTarget) into tRecordID
# tRecordID now contains the cdbRecordID of the created record: 123456abcdef

# Error handling
if not cdb_result() then
	answer cdb_result("response")
end if
```
