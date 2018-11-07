# function cdb_batchCreate(pDataA,pTarget)
---
## Summary
This function allocates new cdbRecordIDs and stores provided data for a batch of records across one or more tables.

## Inputs
* **pInputA** *(Array)* - A multidimensional array, where each key is a tableID. This tableID can be obtained by calling the function *cdb_getTableID*. ([see getTableID](GetTableID.md)). There must be at least one table ID key in the array.
	
	* [tableID 1] *(Array)* - Key that is the first table's ID, which maps to another array of arbitrary recordKeys, where each recordKey maps to a record. There must be at least one record key in this sub-array.
		
		* [indexKey 1] *(Array)* - An arbritrary user-defined name for a record. Recommended names are 1, 2, ..., N. This key maps to a sub-array of keys with data.
    		* [*keyName 1*] *(String)* - A key as defined by the table's schema ([see getTableKeys](./GetTableKeys.md)). User must provide at least one key.
				* value - The value for the corresponding key.
    			
    		* \*[*keyName N*] *(String)* - A key as defined by the table's schema.
    			* value - The value for the corresponding key.
    		
    	* \*[indexKey N] *(Array)* - The nth record. Repeat *indexKey 1*'s sublevel structure.
    * \*[tableID N] *(Array)* - Nth table to create records in. Repeat *tableID 1*'s sublevel structure.

* **pTarget** *(String)* - The place to create the record(s), either "cloud" or "local".

> _*optional parameter._

![BatchCreate input diagram](images/BatchCreateInput.svg)
## Outputs
(Array) - This output array has similar structure to the input array, except that the indexKeys has the cdbRecordID as a child key. The corresponding cdbRecordID keys have empty contents.

![BatchCreate output diagram](images/BatchCreateOutput.svg)
## Additional Requirements
This API call requires internet access if the 'cloud' option is selected

## Examples
```
local tDataA, tTarget, tOutputA, tClientsTableID, tOfficeTableID
     
# Table name: clients
# Keys: firstName, lastName, age, income
put cdb_getTableID("clients") into tClientsTableID

# Table name: office
# Keys: name, address
put cdb_getTableID("office") into tOfficeTableID

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
# tOutputA[tClientsTableID][1] - "12345678-abcd-1234-cdef-1234567890ab"
#                                 cdbRecordID for John Smith
# tOutputA[tClientsTableID][2] - "87654321-abcd-1234-cdef-1234567890ab"
#                                 cdbRecordID for Jenny Smith
# tOutputA[tOfficeTableID][1] - "45678123-abcd-1234-cdef-1234567890ab"
#                                cdbRecordID for Smith's Tech
```