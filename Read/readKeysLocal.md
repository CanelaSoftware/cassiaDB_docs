# function cdb_readKeysLocal(pInputA)
---
## Summary:
This function reads local records and returns only the keys requested from a record’s contents. Function may access 1 to N records from one table.

## Inputs:
* **`pInputA`** *(Array)* - An array of keys containing data per the following format:
    * `["cdbTableName"]` *(String)* - The specified table name.
    * `["cdbRecordID"]` *(String)* - A single cdbRecordID or a line delimited list of cdbRecordIDs.
    * `["keyList"]` *(String)* - A comma delimited list of the keys to be returned from the record.

## Outputs:
(Array) – Containing a partial record with only the keys as defined by the input. 

## API Version:
* `0.3.2` - Introduced

## Examples:
```
local tInputA, tOutputA, tTableID, tRecordIDs

#Table name: clients
#Keys: firstName, lastName, age, income
#RecordIDs (line delimited list): 8b3af158-af3a-4d92-9363-87756711f771

#Input: tInputA
put "clients" into tInputA
put tRecordID into tInputA["cdbRecordID"]
put "age,income" into tInputA["keyList"]
     
put cdb_readKeysLocal(tInputA) into tOutputA

#Output: tOutputA["8b3af158-af3a-4d92-9363-87756711f771"]["age"] - value
#												        ["income"] - value
							  
```
