# function cdb_batchQuery(pDataA, pTarget, *pMode*, *pResultFormat*, *pCollapseArray*)
---
## Summary
This function searches the specified table(s), and returns the subset that matches that query in several possible formats.

## Inputs
* **pDataA** *(Array)* - An array that specify the batch query.
	* [tableID 1] *(Array)* - The key is the table ID, containing an array of one or more queries for this table.
		* [queryID 1] *(Array)* - An arbitrary user-defined name for a query. 
			* ["key"] *(String)* - Contains the table key to be queried.
			* ["value"] *(String)* - Contains the value with which to query.
			* ["operator"] *(String)* - Contains the operator with which to query. (See [operators](./QueryOperators.md))
		* *[queryID N] *(Array)* - The nth query for *tableID 1*. Repeat *queryID 1*'s sublevel structure.
	* *[tableID N] *(Array)* - An array of one or more queries for this table. Repeat *tableID 1*'s sublevel structure.
* **pTarget** *(String)* - The place to query the record(s), either "cloud" or "local".
* \***pMode** *(String)* - Specifies how to logically combine the queries when returning each query's appropriate records.
	* "logicalAND" - Records which match ALL of the provided queries are returned; results are combined into a single query per table.
	* "logicalOR" - Record which match ANY of the provided queries are returned; results are combined into a single query per table.
	* "batch" **(default)** - Each query is executed independently of the others, with distinct results.
* \***pResultFormat** *(String)* - Specifies the output format when returning matched records.
	*  "recordList" **(default)** - Results are line-delimited lists of record IDs.
	*   "recordData" - Results are arrays populated with the full record data of each result.
* \***pCollapseArray** *(String)* - Specifies how to deal with array levels in the result that only contain one key (such as a single table name, or a single query).
	*  "true" - The array is elided from the result.
	*  "false" **(default)** - The array maintains the original structure.

> _\* optional parameter._

> Note: To query all the records containing a specific value in ANY keys, use "\*" as value of the key "key".

![BatchQuery input diagram](images/BatchQueryInput.svg)


## Outputs
* *(Array)* - (the following structure assumes that collapseArray is 'false')
	* [tableID 1] - The first tableID containing each query for that table.
		* [queryID 1] - Contains the results as specified in the 'resultFormat'.
		* [queryID N] - Contains the results as specified in the 'resultFormat' when the 'mode' is not "logicalAND" or "logicalOR".
	* [tableID N] - as above, if queries were executed on multiple tables at once.

## Additional Requirements
This API call requires internet access.

## Examples

```livecodeserver
/*
Table name: clients
Keys: firstName, lastName, age, income


Records: 
[12345678-abcd-1234-cdef-1234567890ab]["firstName"] - "John"
							    ["lastName"] - "Smith"					 					
							    ["age"] - "47"
							    ["income"] - "100000"

[87654321-abcd-1234-cdef-1234567890ab]["firstName"] - "Jenny"
							   ["lastName"] - "Smith"
							   ["age"] - "46"
							   ["income"] - "100000"


Table name: office
Keys: name, address
Records:
[45678123-abcd-1234-cdef-1234567890ab]["name"] - "Smith's Tech"
						 	["address"] - "123 office Road"
*/
```
###Example 1:
```livecodeserver
local tDataA, tTarget, tMode, tResultFormat, tCollapseArray, tOutputA, tClientsTableID, tOfficeTableID

put cdb_tableID("clients") into tClientsTableID                                       
put cdb_tableID("office") into tOfficeTableID

# first query
put "*" into tDataA[tClientsTableID][1]["key"]
put "~" into tDataA[tClientsTableID][1]["operator"]
put "Smith" into tDataA[tClientsTableID][1]["value"]

# second query
put "address" into tDataA[tOfficeTableID][1]["key"]
put "=" into tDataA[tOfficeTableID][1]["operator"]
put "abbey road" into tDataA[tOfficeTableID][1]["value"]

put "cloud" into tTarget
put "batch" into tMode
put "recordList" into tResultFormat
put "false" into tCollapseArray

put cdb_batchQuery(tDataA,tTarget,tMode,tResultFormat,tCollapseArray) into tOutputA

# output array: tOutputA[tClientsTableID][1] - 12345678-abcd-1234-cdef-1234567890ab
									 87654321-abcd-1234-cdef-1234567890ab
									 //This is a line delimited list
```
### Example 2:
```livecodeserver
local tDataA, tTarget, tMode, tResultFormat, tCollapseArray, tOutputA, tClientsTableID, tOfficeTableID

put cdb_tableID("clients") into tClientsTableID                                       
put cdb_tableID("office") into tOfficeTableID

# first query
put "age" into tDataA[tClientsTableID][1]["key"]
put ">=" into tDataA[tClientsTableID][1]["operator"]
put "47" into tDataA[tClientsTableID][1]["value"]

# second query
put "lastName" into tDataA[tClientsTableID][2]["key"]
put "=" into tDataA[tClientsTableID][2]["operator"]
put "Smith" into tDataA[tClientsTableID][2]["value"]

# third query
put "address" into tDataA[tOfficeTableID][1]["key"]
put "=" into tDataA[tOfficeID][1]["operator"]
put "123 office Road" into tDataA[tOfficeTableID][1]["value"]

put "cloud" into tTarget
put "logicalAND" into tMode
put "recordData" into tResultFormat
put "false" into tCollapseArray

put cdb_batchQuery(tDataA,tTarget,tMode,tResultFormat,tCollapseArray) into tOutputA

# output array: tOutputA[tClientsTableID][1]["12345678-abcd-1234-cdef-1234567890ab"]["firstName"] - "John"	 
																   ["lastName"] - "Smith"						 					
																   ["age"] - "47"
																   ["income"] - "100000"
				   [tOfficeTableID][1]["45678123-abcd-1234-cdef-1234567890ab"]["name"] - "Smith's Tech"
																  ["address"] - "123 office Road"
```
###Example 3:
```livecodeserver
local tDataA, tTarget, tMode, tResultFormat, tCollapseArray, tOutputA, tClientsTableID

put cdb_tableID("clients") into tClientsTableID                                       

# first query
put "firstName" into tDataA[tClientsTableID][1]["key"]
put "=" into tDataA[tClientsTableID][1]["operator"]
put "John" into tDataA[tClientsTableID][1]["value"]

# second query
put "firstName" into tDataA[tClientsTableID][2]["key"]
put "=" into tDataA[tClientsTableID][2]["operator"]
put "Jenny" into tDataA[tClientsTableID][2]["value"]

put "cloud" into tTarget
put "logicalOR" into tMode
put "recordList" into tResultFormat
put "false" into tCollapseArray

put cdb_batchQuery(tDataA,tTarget,tMode,tResultFormat,tCollapseArray) into tOutputA

# output array: tOutputA[tClientsTableID][1] - 12345678-abcd-1234-cdef-1234567890ab  
#		 							 87654321-abcd-1234-cdef-1234567890ab
									 //This is a line delimited list
```