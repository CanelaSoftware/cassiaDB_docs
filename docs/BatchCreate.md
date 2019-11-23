# function cdb_batchCreate(pDataA, pTarget, *pInternalA*)
---
Updated 11/22/19
## Summary
This function allocates new cdbRecordIDs and stores provided data for a batch of records across one or more tables.

## Inputs
* **pDataA** *(Array)* - A multidimensional array, where each key is a tableID. This tableID can be obtained by calling the function *cdb_tableID*. ([see TableID](TableID.md)). There must be at least one table ID key in the array.
	
	* [tableID 1] *(Array)* - Key that is the first table's ID, which maps to another array of arbitrary recordKeys, where each recordKey maps to a record. There must be at least one record key in this sub-array.
		
		* [indexKey 1] *(Array)* - An arbritrary user-defined name for a record. Recommended names are 1, 2, ..., N. This key maps to a sub-array of keys with data.
    		* [*keyName 1*] *(String)* - A key as defined by the table's schema ([see TableKeys](./TableKeys.md)). User must provide at least one key.
				* value - The value for the corresponding key.
    			
    		* \*[*keyName N*] *(String)* - A key as defined by the table's schema.
    			* value - The value for the corresponding key.
    		
    	* \*[indexKey N] *(Array)* - The nth record. Repeat *indexKey 1*'s sublevel structure.
    * \*[tableID N] *(Array)* - Nth table to create records in. Repeat *tableID 1*'s sublevel structure.

* **pTarget** *(String)* - The place to create the record(s), either "cloud" or "local".

* \***pInternalA** *(Array)* - An array whose key is "delaySend" and its value is true. Optional parameter if pTarget is "cloud." This will delay processing the cloud call and will store its transaction in "cdbCache." Use [cdb_flushCache](FlushCache.md) to process the delayed transactions.

> _*optional parameter._

![BatchCreate input diagram](images/BatchCreateInput.svg)
## Outputs
*(Array)* - This output array has similar structure to the input array, except that the indexKeys has the cdbRecordID as a child key. The corresponding cdbRecordID keys have empty contents.

![BatchCreate output diagram](images/BatchCreateOutput.svg)
## Additional Requirements
This API call requires internet access in order to create cloud records.

## Examples
```livecodeserver
local tDataA, tTarget, tOutputA, tClientsTableID, tOfficeTableID
     
# Table name: clients
# Keys: firstName, lastName, age, income
put cdb_tableID("clients") into tClientsTableID

# Table name: office
# Keys: name, address
put cdb_tableID("office") into tOfficeTableID

put "John" into tDataA[tClientsTableID][1]["firstName"]
put "Smith" into tDataA[tClientsTableID][1]["lastName"]
put "47" into tDataA[tClientsTableID][1]["age"]
put "100000" into tDataA[tClientsTableID][1]["income"]

put "Jenny" into tDataA[tClientsTableID][2]["firstName"]
put "Smith" into tDataA[tClientsTableID][2]["lastName"]
put "46" into tDataA[tClientsTableID][2]["age"]
put "100000" into tDataA[tClientsTableID][2]["income"]

put "Smith's Tech" into tDataA[tOfficeTableID][1]["name"]
put "123 office road" into tDataA[tOfficeTableID][1]["address"]

put "cloud" into tTarget

put cdb_batchCreate(tDataA,tTarget) into tOutputA

# Output Array: 
# tOutputA[tClientsTableID][1]["12345678-abcd-1234-cdef-1234567890ab"]
#          cdbRecordID for John Smith is 12345678-abcd-1234-cdef-1234567890ab
# tOutputA[tClientsTableID][2]["87654321-abcd-1234-cdef-1234567890ab"]
#          cdbRecordID for Jenny Smith is 87654321-abcd-1234-cdef-1234567890ab
# tOutputA[tOfficeTableID][1]["45678123-abcd-1234-cdef-1234567890ab"]
#          cdbRecordID for Smith's Tech is 45678123-abcd-1234-cdef-1234567890ab
```

```livecodeserver
local tDataA, tTarget, tInternalA, tOutputA, tClientsTableID, tOfficeTableID
     
# Table name: clients
# Keys: firstName, lastName, age, income
put cdb_tableID("clients") into tClientsTableID

# Table name: office
# Keys: name, address
put cdb_tableID("office") into tOfficeTableID

put "Cora" into tDataA[tClientsTableID][1]["firstName"]
put "Doe" into tDataA[tClientsTableID][1]["lastName"]
put "35" into tDataA[tClientsTableID][1]["age"]
put "100000" into tDataA[tClientsTableID][1]["income"]

put "Doe's Electronics" into tDataA[tOfficeTableID][1]["name"]
put "456 Office Road" into tDataA[tOfficeTableID][1]["address"]

put "cloud" into tTarget
put true into tInternalA["delaySend"]

put cdb_batchCreate(tDataA,tTarget,tInternalA) into tOutputA

# Output Array: 
# tOutputA[tClientsTableID][1]["32165478-wxyz-7890-cdef-6544567890ty"]
#          cdbRecordID for Cora Doe is 32165478-wxyz-7890-cdef-6544567890ty
# tOutputA[tOfficeTableID][1]["98778124-idfd-6544-efgf-8744532890po"]
#          cdbRecordID for Doe's Electronics is 98778124-idfd-6544-efgf-8744532890po

# Process the delayed transaction
cdb_flushCache
```