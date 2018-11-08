# function cdb_batchCount(pDataA, pTarget)
---
## Summary
This function counts the number of records (either cloud or local) in multiple tables.

## Inputs
* **pDataA** *(Array)* - Array with the following format:
	* [table ID 1] *(Key)* - Key is the first table's ID.
	* *[table ID N] *(Key)* - Key that is the nth table's ID.
* pTarget *(String)* - The place to count the records from, either "cloud" or "local".

> _*optional parameter._

![BatchCountInput](images/BatchCountInput.svg)

## Outputs
(String) – Contains the numeric count of records in a list of given tables.

## Additional Requirements
This API call requires internet access in order to count cloud records.

## Examples
```
local tCount, tDataA, tTarget, tClientsTableID, tOfficeTableID

#Table name: clients											   #Table name: office
#keys: firstName, lastName, age, income							   #Keys: name, address
#Record: 
#[12345678-abcd-1234-cdef-1234567890ab]["firstName"] - "John"	   #[45678123-abcd-1234-cdef-1234567890ab]["name"] - "Smith's Tech"
									   ["lastName"] - "Smith"						 					  ["address"] - "123 office Road"
									   ["age"] - "47"
									   ["income"] - "100000"
									   
# There is only 1 record each in the table clients and the table office on the cloud.

put cdb_getTableID("clients") into tClientsTableID                                       
put cdb_getTableID("office") into tOfficeTableID

put empty into tDataA[tClientsTableID]
put empty into tDataA[tOfficeTableID]
put "cloud" into tTarget

put cdb_count(tDataA,tTarget) into tCount

# Output: 2
```