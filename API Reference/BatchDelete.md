# command cdb_batchDelete tInputA
---
## Summary:
This function deletes a set of records.

## Inputs:
* **`pInputA`** *(Array)* - A multidimensional array, where each key is a tableID that maps to another array where the keys are recordIDs, and the elements are empty. There must be at least one tableID key in the array.
	* `["cdbTarget"]` *(String)* - place to delete records, either `"cloud"` or `"local"`
    * `[tableID 1]` *(Key)* - Key is the first table's ID, maps to subarray of record IDs.
    	* `[cdbRecordID 1]` *(Key)* - Key that is the record ID for the first record to be deleted, or `"*"` to delete all records in a table. 
    		* `empty` - There must be an empty element child to each record ID
    	* `*[cdbRecordID N]` *(Key)* - Key that is the record ID for the nth record to be deleted.
    		* `empty` - There must be an empty element child to each record ID
    * `*[tableID N]` *(Key)* - Key that is the nth table's ID. Repeat *tableID1*'s sublevel structure.

> _*optional parameter._

> Note: To delete all the records for a given table, use "\*" as key mapping to empty in place of the array of cdbRecordID keys.

![BatchDelete input diagram](../chartimages/deleteReadInput.png)

## Additional Requirements:
This API call requires internet access.

## API Version:
* `0.3.0` - Introduced

## Examples:
```
local tInputA, tOutputA, tClientsTableID, tOfficeTableID
     
#Table name: clients											   #Table name: office				
#RecordIDs: 
#12345678-abcd-1234-cdef-1234567890ab	   					       #45678123-abcd-1234-cdef-1234567890ab
 87654321-abcd-1234-cdef-1234567890ab

put cdb_getTableID("clients") into tClientsTableID                                       
put cdb_getTableID("office") into tOfficeTableID
     
put empty into tInputA[tClientsTableID]["*"]
put empty into tInputA[tOfficeTableID]["45678123-abcd-1234-cdef-1234567890ab"]
     
put "cloud" into tInputA["cdbTarget"]

cdb_batchDelete tInputA

#Now both tables have no records inside
```