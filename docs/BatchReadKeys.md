# function cdb_batchReadKeys(pInputA)
---
## Summary
This function reads records and returns only the keys requested from each record’s contents. Function may access records from multiple tables in the same call.

## Inputs
* **pInputA** *(Array)* - A multidimensional array, where each key is a tableID that maps to another array where the keys are recordIDs, and the elements are empty. There must be at least one tableID key in the array.
	* ["cdbTarget"] *(String)* - place to read records, either "cloud" or "local"
    * [tableID 1] *(Key)* - Key is the first table's ID, maps to subarray of record IDs.
    	* [cdbRecordID 1] *(Key)* - Key that is the record ID for the first record to be read, or "*" to read all records in a table.
	    	* [keyName 1] *(Key)* - Key that is the keyName for the first record to be read
				* empty - There must be an empty element child to each keyName
			* *[keyName N] *(Key)* - Key that is the keyName for the nth record to be read
				* empty - There must be an empty element child to each keyName
    	* *[cdbRecordID N] *(Key)* - key that is the record ID for the nth record wanting to be read. Repeat *cdbRecordID 1*'s subarray structure
    * *[tableID N] *(Key)* - key that is the nth table's ID. Repeat *tableID 1*'s subarray structure.


## Outputs
(Array) – Containing a partial record with only the keys as defined by the input. 

## API Version
* 0.3.1 - Introduced

## Examples
```
local tInputA, tOutputA, tTableID, tRecordIDs

#Table name: clients
#Keys: firstName, lastName, age, income
#TableID: 701bf5f3-8080-444c-b287-2f8dddc7e268
#RecordIDs (line delimited list): 8b3af158-af3a-4d92-9363-87756711f771

put cdb_getTableID("clients") into tTableID

#Input: tInputA
repeat for each line xRecordID in tRecordIDs
	put empty into tInputA[tTableID][xRecordID]["age,income"]
end repeat

put "cloud" into tInputsA["cdbTarget"]
     
put cdb_batchReadKeys(tInputA) into tOutputA

#Output: tOutputA["701bf5f3-8080-444c-b287-2f8dddc7e268"]["8b3af158-af3a-4d92-9363-87756711f771"]["age"] - value
#												                                              ["income"] - value
							  
```
