# function cdb_batchRead(pDataA, pTarget)
---
## Summary
This function reads a list of records and returns those records' contents.

## Inputs
* **pDataA** *(Array)* - A multidimensional array, where the first key is a tableID that maps to another array where the keys are recordIDs, and the elements are empty. There must be at one tableID key in the array.
    * [tableID] *(Key)* - Key is the table's ID, maps to subarray of record IDs.
    	* [cdbRecordID 1] *(Key)* - Key that is the cdbRecordID of the first record to be read, or "*" to read all records in a table. 
    		* empty - The value of the corresponding key must be empty.
    	* *[cdbRecordID N] *(Key)* - Key that is the cdbRecordID of the nth record to be read. 
    		* empty - The value of the corresponding key must be empty.
    		
* **pTarget** *(String)* - The place to read the record(s), either "cloud" or "local".

> _\* optional parameter._

> Note: To read all the records for a given table, use "\*" as key mapping to empty in place of the array of cdbRecordID keys.

![BatchRead input diagram](images/BatchReadInput.svg)
## Outputs
(Aray) - A multidimensional array with the same structure as the input array. The empty values for each cdbRecordID have been replaced with the keys and values of the corresponding record.

![BatchRead output diagram](images/BatchReadOutput.svg)

## Additional Requirements
This API call requires internet access.


## Examples
```livecodeserver
local tDataA, tTarget, tOutputA, tClientsTableID, tOfficeTableID

# Table name: clients	   			
# cdbRecordIDs: 
# 12345678-abcd-1234-cdef-1234567890ab	   
# 87654321-abcd-1234-cdef-1234567890ab
 
# Table name: office
# cdbRecordIDs:
# 45678123-abcd-1234-cdef-1234567890ab


put cdb_getTableID("clients") into tClientsTableID                                       
put cdb_getTableID("office") into tOfficeTableID
     
put empty into tDataA[tClientsTableID]["*"]
put empty into tDataA[tOfficeTableID]["45678123-abcd-1234-cdef-1234567890ab"]

put "cloud" into tTarget
     
put cdb_batchRead(tDataA,tTarget) into tOutputA

# Output Array:
# tOutputA[tClientsTableID]["12345678-abcd-1234-cdef-1234567890ab"]["firstName"] - "John"
# tOutputA[tClientsTableID]["12345678-abcd-1234-cdef-1234567890ab"]["lastName"] - "Smith"
# tOutputA[tClientsTableID]["12345678-abcd-1234-cdef-1234567890ab"]["age"] - "47"
# tOutputA[tClientsTableID]["12345678-abcd-1234-cdef-1234567890ab"]["income"] - "100000"

# tOutputA[tClientsTableID]["87654321-abcd-1234-cdef-1234567890ab"]["firstName"] - "Jenny"
# tOutputA[tClientsTableID]["87654321-abcd-1234-cdef-1234567890ab"]["lastName"] - "Smith"
# tOutputA[tClientsTableID]["87654321-abcd-1234-cdef-1234567890ab"]["age"] - "46"
# tOutputA[tClientsTableID]["87654321-abcd-1234-cdef-1234567890ab"]["income"] - "100000"
                        
# tOutputA[tOfficeTableID]["45678123-abcd-1234-cdef-1234567890ab"]["name"] - "Smith's Tech"
# tOutputA[tOfficeTableID]["45678123-abcd-1234-cdef-1234567890ab"]["address"] - "123 office road"                                                                   
```
