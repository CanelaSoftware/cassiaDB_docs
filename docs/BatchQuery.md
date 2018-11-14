# function cdb_BatchQuery(pInputA)
---
## Summary
This function searches the specified table(s), and returns the subset that matches that query in several possible formats.

## Inputs
* **pInputA** *(Array)* - An array that specify the batch query and the query settings.
	* ["cdbTarget"] *(String)* - place to query records, either "cloud" or "local"
	* ["batchQuery"] *(Array)* - A sub-array, with keys being the one or more table IDs to be queried upon.
			* [tableID 1] *(Array)* - The key is the table ID, containing an array of one or more queries for this table.
				* [query 1] *(Array)* - An arbitrary user-defined name for a query. 
					* ["key"] *(String)*- Contains the table key to be queried
					* ["value"] *(String)*- Contains the value with which to query
					* ["operator"] *(String)*- Contains the operator with which to query. (See [operators](./QueryOperators.md)).
				* *[query N] *(Array)* - The nth query for *tableID 1*. Repeat *query 1*'s sublevel structure.
		* *[tableID N] *(Array)* - An array of one or more queries for this table. Repeat *table ID 1*'s sublevel structure.
	* *["settings"] *(Array)* - An array of keys that can be set to produce different output forms.
		* *["mode"] *(String)* - Specifies how to logically combine the queries when returning each query's appropriate records. Here are options for this:
			- "logicalAND" - records which match ALL of the provided queries are returned; results are combined into a single query per table.
			- "logicalOR" - record which match ANY of the provided queries are returned; results are combined into a single query per table.
			- "advanced" - records match a mix of ANDs and ORs per provided logic map (see below); results are combined into a single query table
			- "batch" - each query is executed independently of the others, with distinct results (default).
		* *["resultFormat"] *(String)* - specifies the output format when returning matched records.
			- "recordList" - results are line-delimited lists of record IDs (default).
			- "recordData" - results are arrays populated with the full record data of each result.
		* *["collapseArray"] *(String)* - specifies how to deal with array levels in the the result that only contain one key (such as a single table name, or a single query)
			- true - the array is elided from the result.
			- false - the array maintains the original structure (default).
		* *["logicMap"] *(Array)* - _Only used for "advanced" queries._ Defines the logic map used for all tables
			* [tableID 1] *(String)* - A Logic map for the first table. This contains the names of the queries with AND, OR between them.
			* [tableID N] *(String)* - A Logic map for the nth table.

![BatchQuery input diagram](images/BatchQueryInput.svg)

> _*optional parameter._

> Note: To query all the records containing a specific value in ANY keys, use "\*" as value of the key "key".

## Outputs
* *(Array)* - (the following structure assumes that collapseArray is 'false')
	* [tableID 1] - The first tableID containing each query for that table.
		* [query 1] - contains the results as specified in the 'resultFormat'.
		* [query N] - contains the results as specified in the 'resultFormat' when the 'mode' is not "logicalAND" or "logicalOR".
	* [tableID N] - as above, if queries were executed on multiple tables at once.

## Additional Requirements
This API call requires internet access.
	
## API Version
* 0.3.1 - Introduced

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
local tInputA, tOutputA, tClientsTableID, tOfficeTableID
																			 
put cdb_getTableID("clients") into tClientsTableID                                       
put cdb_getTableID("office") into tOfficeTableID

# first query
put "*" into tInputA["batchQuery"][tClientsTableID][1]["key"]
put "~" into tInputA["batchQuery"][tClientsTableID][1]["operator"]
put "Smith" into tInputA["batchQuery"][tClientsTableID][1]["value"]

# second query
put "address" into tInputA["batchQuery"][tOfficeID][1]["key"]
put "=" into tInputA["batchQuery"][tOfficeID][1]["operator"]
put "abbey road" into tInputA["batchQuery"][tOfficeID][1]["value"]

# settings
put "recordlist" into tInputA["settings"]["resultFormat"] 

put "cloud" into tInputA["cdbTarget"]

put cdb_BatchQuery(tInputA) into tOutputA

# output array: tOutputA[tClientsTableID][1] - 12345678-abcd-1234-cdef-1234567890ab
									 87654321-abcd-1234-cdef-1234567890ab
									 //This is a line delimited list
```
### Example 2:
```livecodeserver
# first query
put "age" into tInputA["batchQuery"][tClientsTableID][1]["key"]
put ">=" into tInputA["batchQuery"][tClientsTableID][1]["operator"]
put "47" into tInputA["batchQuery"][tClientsTableID][1]["value"]

# second query
put "lastName" into tInputA["batchQuery"][tClientsTableID][2]["key"]
put "=" into tInputA["batchQuery"][tClientsTableID][2]["operator"]
put "Smith" into tInputA["batchQuery"][tClientsTableID][2]["value"]

# third query
put "address" into tInputA["batchQuery"][tOfficeID][1]["key"]
put "=" into tInputA["batchQuery"][tOfficeID][1]["operator"]
put "123 office Road" into tInputA["batchQuery"][tOfficeID][1]["value"]

# settings
put "recordData" into tInputA["settings"]["resultFormat"] 
put "logicalAND" into tInputA["settings"]["mode"]

put "cloud" into tInputA["cdbTarget"]

put cdb_BatchQuery(tInputA) into tOutputA

# output array: tOutputA[tClientsTableID][1]["12345678-abcd-1234-cdef-1234567890ab"]["firstName"] - "John"	 
																   ["lastName"] - "Smith"						 					
																   ["age"] - "47"
																   ["income"] - "100000"
				   [tOfficeTableID][1]["45678123-abcd-1234-cdef-1234567890ab"]["name"] - "Smith's Tech"
																  ["address"] - "123 office Road"
```
###Example 3 (Advanced):
```livecodeserver
local tInputA, tOutputA, tClientsTableID
																			 
put cdb_getTableID("clients") into tClientsTableID

# first query
put "firstName" into tInputA["batchQuery"][tClientsTableID]["fname"]["key"]
put "=" into tInputA["batchQuery"][tClientsTableID]["fname"]["operator"]
put "John" into tInputA["batchQuery"][tClientsTableID]["fname"]["value"]

# second query
put "lastName" into tInputA["batchQuery"][tClientsTableID]["last_s"]["key"]
put "begins with" into tInputA["batchQuery"][tClientsTableID]["last_s"]["operator"]
put "s" into tInputA["batchQuery"][tClientsTableID]["last_s"]["value"]

# third query
put "lastName" into tInputA["batchQuery"][tClientsTableID]["last_t"]["key"]
put "begins with" into tInputA["batchQuery"][tClientsTableID]["last_t"]["operator"]
put "t" into tInputA["batchQuery"][tClientsTableID]["last_t"]["value"]

# settings
put "recordlist" into tInputA["settings"]["resultFormat"] 
put "advanced" into tInputA["settings"]["mode"]
put "cloud" into tInputA["cdbTarget"]

# logic map
put "fname and (last_s or last_t)" into tInputA["settings"]["logicMap"]

put cdb_BatchQuery(tInputA) into tOutputA

# output array: tOutputA[tClientsTableID][1] - 12345678-abcd-1234-cdef-1234567890ab  
									 87654321-abcd-1234-cdef-1234567890ab
# This is a line delimited list containing all record with first name "John" and last name beginning with "s" or "t"
```