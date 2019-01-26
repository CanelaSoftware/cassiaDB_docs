# function cdb_batchSort(pDataA, pTarget)
---
## Summary
This function sorts the given list of record IDs based on a specified table key, direction, and sort type.

## Inputs
* **pDataA** *(Array)* - A multidimensional array, where each key is a tableID that maps to another array where the keys are recordIDs, and the elements are empty.
	* [table ID 1] *(Key)* - Key is the first table's ID, maps to subarray of record IDs.
		* ["sortKey"] *(String)* - The name of the key in the table to sort records by.
		* ["direction"] *(String)* - Determines which direction, ascending or descending, to sort the records by.
		* ["sortType"] *(String)* - must be one of the following:
			* "binary"
			* "dateTime"
			* "international"
			* "numeric
			* "text"
		* [cdbRecordID 1] *(Key)* - Key that is the record ID for the first record to be sorted, or "*" to sort all records in a table.
			* empty - The value of the corresponding key must be empty.
		* *[cdbRecordID N] *(Key)* - Key that is the record ID for the nth record to be sorted.
			* empty - The value of the corresponding key must be empty.
	* *[table ID N] *(Key)* - Key that is the nth table's ID. Repeat *tableID1*'s sublevel culture.

* **pTarget** *(String)* - The place to sort the records from, either "cloud" or "local". 

> \* _optional parameter_
 
> Note: To sort all the records for a given table, use "\*" as key mapping to empty in place of the array of cdbRecordID keys.

![BatchSortInput](images/BatchSortInput.svg)

## Outputs
*(Array)* – This output array consists of the table IDs as keys whose values are record IDs in line-delimited strings.

![BatchSortOutput](images/BatchSortOutput.svg)

## Additional Requirements
This API call requires internet access in order to sort cloud records.

## Example
```livecodeserver
local tDataA, tClientsTableID, tTarget, tOutputA

# Table name: clients						
# Keys: firstName, lastName, age, income	
# Records: 
# [12345678-abcd-1234-cdef-1234567890ab]["firstName"] - "John"
#									   ["lastName"] - "Smith"
#									   ["age"] - "47"
#									   ["income"] - "100000"
									   
# [87654321-abcd-1234-cdef-1234567890ab]["firstName"] - "Jenny"
#									   ["lastName"] - "Smith"
#									   ["age"] - "46"
#									   ["income"] - "100000"

put cdb_tableID("clients") into tClientsTableID

put "age" into tDataA[tClientsTableID]["sortKey"]
put "ascending" into tDataA[tClientsTableID]["direction"]
put "numeric" into tDataA[tClientsTableID]["sortType"]
put "12345678-abcd-1234-cdef-1234567890ab,87654321-abcd-1234-cdef-1234567890ab" into tDataA[tClientsTableID]["cdbRecordID"]
put "cloud" into tTarget

put cdb_batchSort(tDataA,tTarget) into tOutputA

# tOutput array: tOutputA[tClientsTableID]["87654321-abcd-1234-cdef-1234567890ab"]["firstName"] - "Jenny"
#										 									 	  ["lastName"] - "Smith"
#																			 	  ["age"] - "46"
#																			 	  ["income"] - "100000"
#										  ["12345678-abcd-1234-cdef-1234567890ab"]["firstName"] - "John"
#							 	  												  ["lastName"] - "Smith"
#							 	  												  ["age"] - "47"
#																			 	  ["income"] - "100000"
```