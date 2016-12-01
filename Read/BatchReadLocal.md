# function cdb_batchReadLocal(pInputA)
---
## Summary:
This function reads a list of local records and returns those records' contents. It takes the input array and essentially fills the empty contents of each cdbRecordID key.

## Inputs:
* **`pInputA`** *(Array)* - A multidimensional array of keys, where each key is a table UUID that maps to another array of keys. This table UUID can be obtained by calling the function *cdb_getTableID* and passing in the table name, returning the table's unique UUID. There must be at least one table UUID key in the array.
    * `[tableID 1]` *(Key)* - key to the first table's UUID, which maps to an array of keys, where each key is a cdb record UUID. There must be at least one record UUID key in this sub-array.
    	* `[cdbRecordID 1]` *(Key)* - key that is the record UUID for the first record wanting to be read. Must put empty or any arbirary value in it. 
    	* `*[cdbRecordID N]` *(Key)* - key that is the record UUID for the nth record wanting to be read. Must put empty or any arbirary value in it.
    * `*[tableID N]` *(Key)* - key that is the nth table's UUID. Repeat *tableID1*'s sublevel structure.

> _*optional parameter._

> Note: To read all the records for a given table, use "\*" as key mapping to empty in place of the array of cdbRecordID keys.

![BatchRead input diagram](../chartimages/deleteReadInput.png)
## Outputs:
(Aray) -- This output array is essentially the same as the input array but with the contents of the cdbRecordID keys filling with the appropriate information for that record. The cdbRecordID keys maps to an array of keys that are the keyNames for that record. Each keyName maps to the stored data that corresponds to that keyname.

![BatchRead output diagram](../chartimages/readOutput.png)


## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tInputA, tOutputA, tClientsTableID, tOfficeTableID

#Table name: clients											   #Table name: office				
#RecordIDs: 
#12345678-abcd-1234-cdef-1234567890ab	   					   #45678123-abcd-1234-cdef-1234567890ab
 87654321-abcd-1234-cdef-1234567890ab

put cdb_getTableID("clients") into tClientsTableID                                       
put cdb_getTableID("office") into tOfficeTableID
     
put empty into tInputA[tClientsTableID]["*"]
put empty into tInputA[tOfficeTableID]["45678123-abcd-1234-cdef-1234567890ab"]
     
put cdb_batchReadLocal(tInputA) into tOutputA

#output array: tOutputA[tClientsTableID]["12345678-abcd-1234-cdef-1234567890ab"]["firstName"] - "John"
																				["lastName"] - "smith"
                                        ["87654321-abcd-1234-cdef-1234567890ab"]["firstName"] - "Jenny"
                                        										["lastName"] - "Smith"
                        [tOfficeTableID]["45678123-abcd-1234-cdef-1234567890ab"]["name"] - "Smith's Tech"
                       														 ["address"] - "123 office road"
                                                                             
```