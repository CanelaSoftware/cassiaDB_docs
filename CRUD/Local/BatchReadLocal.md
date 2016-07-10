# cdb_batchReadLocal
---
```
function cdb_batchReadLocal(pRecordA)
```
## Summary:
This function reads a list of local records and returns those records' contents. It takes the input array and essentially fills the empty contents of each cdbRecordID key.

## Inputs:
* **`pRecordA`** *(Array)* - A multidimensional array of keys, where each key is a table UID that maps to another array of keys. This table UID can be obtained by calling the function *cdx_getTableID* and passing in the table name, returning the table's unique UID. There must be at least one table UID key in the array.
    * `[`*`tableID 1`*`]` *(String)* - key to the first table's UID, which maps to an array of keys, where each key is a cdb record UID. There must be at least one record UID key in this sub-array.
    	* `[`*`cdbRecordID 1`*`]` *(String)* - key that is the record UID for the first record wanting to be read. Must put empty or any arbirary value in it.
    	* `*[`*`cdbRecordID N`*`]` *(String)* - key that is the record UID for the nth record wanting to be read. Must put empty or any arbirary value in it.
    * `*[`*`tableID N`*`]` *(String)* - key that is the nth table's UID. Repeat *tableID1*'s sublevel structure.

> _*optional parameter._

![alt text] (https://github.com/CanelaSoftware/cassiaDB_docs/blob/master/chartimages/readInput.png)
## Outputs:
(Aray) -- This output array is essentially the same as the input array but with the contents of the cdbRecordID keys filling with the appropriate information for that record. The cdbRecordID keys maps to an array of keys that are the keyNames for that record. Each keyName maps to the stored data that corresponds to that keyname.

![alt text] (https://github.com/CanelaSoftware/cassiaDB_docs/blob/master/chartimages/readOutput.png)


## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tRecordA, tTableID
     
put cdx_getTableID("clients") into tTableID
     
repeat for each line xRecordID in fld "recordIDtRecordA"
	put empty into tRecordA[tTableID][xRecordID]
end repeat
     
put cdb_batchReadLocal(tRecordA) into tRecordA
```