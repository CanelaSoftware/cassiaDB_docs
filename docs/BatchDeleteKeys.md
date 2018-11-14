# command cdb_batchDeleteKeys pDataA, pTarget
---
## Summary
This function deletes specified keys for a batch of records across one or more tables.

## Inputs
* **pDataA** *(Array)* - A multidimensional array, where each key is a tableID that maps to another array where the keys are recordIDs, and the elements are table keys with empty values. There must be at least one tableID key in the array.
    * [tableID 1] *(Key)* - Key is the first table's ID, maps to subarray of record IDs.
    	* [cdbRecordID 1] *(Key)* - Key that is the record ID for the first record to delete keys from, or "*" to read all records in a table.
	    	* [keyName 1] *(Key)* - Key that is the keyName for the first record to have this key deleted
				* empty - The value of the corresponding key must be empty.
			* \*[keyName N] *(Key)* - Key that is the keyName for the nth record to have this key deleted
				* empty - The value of the corresponding key must be empty.
    	* \*[cdbRecordID N] *(Key)* - key that is the record ID for the nth record to delete keys from. Repeat *cdbRecordID 1*'s subarray structure
    * \*[tableID N] *(Key)* - key that is the nth table's ID. Repeat *tableID 1*'s subarray structure.

* **pTarget** *(String)* - The place to delete keys(s), either "cloud" or "local".

> _*optional parameter._

![BatchDeleteKeys input diagram](images/BatchDeleteKeysInput.svg)

## Additional Requirements
This API call requires internet access to make cloud calls.

## Examples
```livecodeserver
local tDataA, tRecordIDs, tTarget, tTableID

# Table name: clients
# Keys: firstName, lastName, age, income
# cdbRecordIDs: 
# 87654321-abcd-1234-cdef-1234567890ab
# 12345678-abcd-1234-cdef-1234567890ab

put cdb_getTableID("clients") into tTableID

put "87654321-abcd-1234-cdef-1234567890ab" into tRecordIDs
put "12345678-abcd-1234-cdef-1234567890ab" into tRecordIDs

repeat for each line xRecordID in tRecordIDs
	put empty into tDataA[tTableID][xRecordID]["age"]
	put empty into tDataA[tTableID][xRecordID]["income"]
end repeat

put "cloud" into tTarget
     
cdb_batchDeleteKeys tDataA,tTarget
```
