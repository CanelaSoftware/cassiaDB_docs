# function cdb_sort(pSortKey, pDirection, pSortType, pTable, pRecordIDs, pTarget)
---
## Summary
This function sorts the given list of record IDs based on a specified table key, direction, and sort type.

## Inputs
* **pSortKey** *(String)* - The name of the key in the table to sort records by.
* **pDirection** *(String)* - Determines which direction, ascending or descending, to sort the records by.
* **pSortType** *(String)* - must be one of the following:
	* "binary"
	* "dateTime"
	* "international"
	* "numeric
	* "text"
* **pTable** *(String)* - The specified name of the table to be sorted.
* **pRecordIDs** *(String)* - The line-delimited list of record IDs.
* **pTarget** *(String)* - The place to sort the records from, either "cloud" or "local".

## Outputs
*(String)* – Line-delimited list of record IDs in the order specified according to the parameters.

## Additional Requirements
This API call requires internet access in order to sort cloud records.

## Examples
```livecodeserver
local tSortKey, tDirection, tSortType, tTable, tRecordIDs, tTarget, tOutput

# Table name: clients						
# Keys: firstName, lastName, age, income	
# Record: 
# [12345678-abcd-1234-cdef-1234567890ab]["firstName"] - "John"
										 ["lastName"] - "Smith"						 				
																			 ["age"] - "47"
																			 ["income"] - "100000"
[87654321-abcd-1234-cdef-1234567890ab]["firstName"] - "Jenny"
										 ["lastName"] - "Smith"
																			 ["age"] - "46"
																			 ["income"] - "100000"

put "age" into tSortKey
put "ascending" into tDirection
put "numeric" into tSortType
put "clients" into tTable
put "12345678-abcd-1234-cdef-1234567890ab" into tRecordIDs
put lf & "87654321-abcd-1234-cdef-1234567890ab" after tRecordIDs
put "cloud" into tTarget

cdb_sort(tSortKey,tDirection,tSortType,tTable,tRecordIDs,tTarget) into tOutput

# tOutput:
87654321-abcd-1234-cdef-1234567890ab
12345678-abcd-1234-cdef-1234567890ab
```