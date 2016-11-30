# function cdb_batchReadKeysLocal(pInputA)

## Summary:
This function reads local record/s and returns only the keys requested from a record’s contents. Function may access 1 to N records in one or more tables in the same call.

## Inputs:
* **`pInputA`** *(Array)* - A multidimensional array of keys, where each key is a table UUID that maps to another array of keys. This table UUID can be obtained by calling the function *cdb_getTableID* and passing in the table name, returning the table's unique UUID. There must be at least one table UUID key in the array.
    * `[tableID 1]` *(Key)* - key to the first table's UUID, which maps to an array of keys, where each key is a cdb record UUID. There must be at least one record UID key in this sub-array.
    	* `[cdbRecordID 1]` *(Key)* - key that is the record UUID for the first record wanting to be read. Must put empty value in it.
    		* `[key1,key2,key3]` *(Key)* - comma delimited list of keys in the record.
    	* `[cdbRecordID N]` *(Key)* - key that is the record UUID for the nth record wanting to be read. Must put empty value in it.
    * `[tableID N]` *(Key)* - key that is the nth table's UUID. Repeat *tableID 1's* sublevel structure.


## Outputs:
(Array) – Containing a partial record with only the keys as defined by the input. 

## API Version:
* `0.3` - Introduced

## Examples:
```
local tInputA, tOutputA, tTableID, tRecordIDs

#Table name: clients
#Schema: firstName, lastName, age, income
#TableID: 701bf5f3-8080-444c-b287-2f8dddc7e268
#RecordIDs (line delimited list): 8b3af158-af3a-4d92-9363-87756711f771

put cdb_getTableID("clients") into tTableID

#Input: tInputA
repeat for each line xRecordID in tRecordIDs
	put empty into tInputA[tTableID][xRecordID]["age,income"]
end repeat
     
put cdb_batchReadKeysLocal(tInputA) into tOutputA

#Output: tOutputA["701bf5f3-8080-444c-b287-2f8dddc7e268"]["8b3af158-af3a-4d92-9363-87756711f771"]["age"] - value
#												                                              ["income"] - value
							  
```
