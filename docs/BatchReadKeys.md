# function cdb_batchReadKeys(pDataA, pTarget)
---
## Summary
This function reads records for a batch of records across one or more tables and returns only the keys requested from each record’s contents.

## Inputs
* **pDataA** *(Array)* - A multidimensional array, where each key is a tableID that maps to another array where the keys are recordIDs, and the elements are empty. There must be at least one tableID key in the array.
    * [tableID 1] *(Key)* - Key is the first table's ID, maps to subarray of record IDs.
    	* [cdbRecordID 1] *(Key)* - Key that is the record ID for the first record to be read, or "*" to read all records in a table.
	    	* [keyName 1] *(Key)* - Key that is the keyName for the first record to be read
				* empty - The value of the corresponding key must be empty.
			* \*[keyName N] *(Key)* - Key that is the keyName for the nth record to be read
				* empty - The value of the corresponding key must be empty.
    	* \*[cdbRecordID N] *(Key)* - key that is the record ID for the nth record wanting to be read. Repeat *cdbRecordID 1*'s subarray structure
    * \*[tableID N] *(Key)* - key that is the nth table's ID. Repeat *tableID 1*'s subarray structure.

* **pTarget** *(String)* - The place to create the record(s), either "cloud" or "local".

> _*optional parameter._

## Outputs
(Array) – A multidimensional array with the same structure as the input array. The empty values for each key have been replaced with their corresponding value.

## Examples
```
local tDataA, tOutputA, tTableID, tRecordIDs, tTarget

# Table name: clients
# Keys: firstName, lastName, age, income
# TableID: 701bf5f3-8080-444c-b287-2f8dddc7e268
# cdbRecordID: 87654321-abcd-1234-cdef-1234567890ab

put cdb_getTableID("clients") into tTableID
put "87654321-abcd-1234-cdef-1234567890ab" into tRecordIDs

repeat for each line xRecordID in tRecordIDs
	put empty into tDataA[tTableID][xRecordID]["age"]
	put empty into tDataA[tTableID][xRecordID]["income"]
end repeat

put "cloud" into tTarget
     
put cdb_batchReadKeys(tDataA,tTarget) into tOutputA

# Output Array: 
# tOutputA["701bf5f3-8080-444c-b287-2f8dddc7e268"]["87654321-abcd-1234-cdef-1234567890ab"]["age"] - 46
# tOutputA["701bf5f3-8080-444c-b287-2f8dddc7e268"]["87654321-abcd-1234-cdef-1234567890ab"]["income"] - 100000
```
