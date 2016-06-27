# BatchCreateLocal
---
```
function cdb_batchCreateLocal(pRecordA)
```
## Summary:
This function locally (but not in the cloud) allocates a new cdbRecordID for a batch of records across one or more database tables, storing the provided data.

## Inputs:
* **`pRecordA`** *(Array)* - A multidimensional array of keys, where each key is a table UID to another array of keys. This table UID can be obtained by calling the function *cdx_getTableID* and passing in the table name, returns the table's unique UID. There must be at least one table UID key in the array.
    * `[`*`tableID 1`*`]` *(String)* - The first table's UID, which is a key to another array, where each element is an arbritrary key for a record. There must be at least one record key in this sub-array.
    	* `[`*`recordKey 1`*`]` *(String)* - An arbritrary user-defined key for a record. Recommended keys are 1, 2, ..., N, where N is the number of stored records in the table with a UID of *tableID 1*. Each element in this sub-array is a key for the actual data to store in a record. There must be at least one key name in this sub array. 
    		* `[`*`keyName 1`*`]` *(String)* - User-defined keyname, where *keyName 1* is an arbitrary key name. Each keyname maps to the actual user data to store. User must provide at least key to a stored value.
    			*  `yourData` *(String)* - the actual data the user wants to store in this keyname in this record in this table.
    		* `*[`*`keyName N`*`]` *(String)* - The nth user-defined keyname. Repeat *keyName 1*'s sublevel structure.
    	* `*[`*`recordKey N`*`]` *(String)* - The nth record key. Repeat *recordKey 1*'s sublevel structure.
    * `*[`*`tableID N`*`]` *(String)* - The nth table's UID. Repeat *tableID 1*'s sublevel structure.

> _*optional parameter._

![alt text] (file:///Users/georgekarma/Desktop/Screen%20Shot%202016-06-27%20at%208.58.01%20AM.png)
## Outputs:
(Array) -- An array of keys where each key is a table's UID. Each table UID keys to another array of keys where each key is the cdbRecordID for each newly created record in the respective order of recordKeys in the input array. Each cdbRecordID key maps to empty.

![alt text] (file:///Users/georgekarma/Desktop/Screen%20Shot%202016-06-27%20at%2010.17.23%20AM.png)
## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tDataA, tTableID
     
put cdx_getTableID("clients") into tTableID
          
put fld "firstName" into tDataA[tTableID][1]["firstName"]
put fld "lastName" into tDataA[tTableID][1]["lastName"]
put fld "age" into tDataA[tTableID][1]["age"]
put fld "income" into tDataA[tTableID][1]["income"]

put fld "firstName2" into tDataA[tTableID][2]["firstName"]
put fld "lastName2" into tDataA[tTableID][2]["lastName"]
put fld "age2" into tDataA[tTableID][2]["age"]
put fld "income2" into tDataA[tTableID][2]["income"]

put cdb_batchCreateLocal(tDataA) into tDataA
```