# function cdb_batchAdvancedQuery(pDataA, pAdvancedMapA, pTarget, *pResultFormat*, *pAggregateA*, *pRecordIDA*)
---
## Summary
This function searches across one or more tables using specified logic maps and returns records that match the query/queries.

## Inputs
* **pDataA** *(Array)* - An array defining the queries.
	* [tableID 1] *(Array)* - Key that is the first table's ID, which maps to another array.
		* [queryID 1] *(Array)* - Key name is an arbitrary user-defined name for a query. 
			* ["key"] *(String)* - Contains the table key to be queried.
			* ["value"] *(String)* - Contains the value with which to query.
			* ["operator"] *(String)* - Contains the operator with which to query. (See [operators](./QueryOperators.md))
		* \*[queryID N] *(Array)* - The nth query. Repeat *query 1*'s sublevel structure.
	* \*[tableID N] *(Array)* - The nth table. Repeat *tableID 1*'s sublevel structure.
* **pAdvancedMapA** *(Array)* - Defines the advanced map(s) used for the batch query.
	* [tableID 1] *(String)* - Each map contains the names of the queries with AND/OR/XOR between them. Parentheses can be used to specify order of operations. e.g. "(query1 AND query2) OR (query3 AND query4)"
	* \*[tableID N] *(String)* - The nth table. Repeat *tableID 1*'s sublevel structure.
* **pTarget** *(String)* - The place to query records, either "cloud" or "local".
* \***pResultFormat** *(String)* - Specifies the output format when returning matched records.
	- "recordList" **(default)** - Results are line-delimited lists of record IDs.
	- "recordData" - Results are arrays populated with the full record data of each result.
* \***pAggregateA** *(Array)* - Defines the aggregation(s) used for the batch query.
	* [tableID 1] *(Array)* - Array containing the following keys:
		* ["aggregateKey"] *(String)* - The name of the key to perform the aggregation on.
		* ["aggregateFunction"] *(String)* - Determines the aggregation property.
			* "avg" - The average of the values.
			* "count" - The number of occurrences of each value.
			* "min" - The minimum value.
			* "max" - The maximum value.
			* "sum" - The sum of all the values.
		* ["groupBy"] *(String)* - The name of the key to sort the query results by. Key is sorted by ascending order.
	* \*[tableID N] *(Array)* - The nth table. Repeat *tableID 1*'s sublevel structure.
* \***pRecordIDA** *(Array)* - Defines the records in each table to query on.
	* [tableID 1] *(String)* - Line-delimited list of record IDs or "*" for the entire table.
	* \*[tableID N] *(String)* -The nth table. Repeat *tableID 1*'s sublevel structure.

> _*optional parameter._

> Note: To query all the records containing a specific value in ANY keys, use "\*" as value of the key "key".

![BatchAdvancedQueryInput](images/BatchAdvancedQueryInput.svg)


## Outputs
*(Array)* - Depending on the value of *pResultFormat*.

* If *pResultFormat* is "recordList" or if no such key is provided:
	* Output is an array where each key is a tableID mapped to a backslash-delimited string of recordIDs that match the query.
* If *pResultFormat* is "recordData":
	* Output is an array where each key is a tableID mapped to an array whose keys are recordIDs that match the query and whose values are their respective data.

![BatchAdvancedQuery output diagram](images/BatchAdvancedQueryOutput.svg)
## Additional Requirements
This API call requires internet access to query data on the cloud.
	
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
### Example 1:
```livecodeserver
# We want to find all clients that have last name "Smith" 
# and a first name that ends with "n" or "y" and
# all offices that have "tech" in their name.

local tDataA, tAdvancedMapA, tTarget, tResultFormat, tClientsTableID, tOfficeTableID, tOutputA

put cdb_tableID("clients") into tClientsTableID
put cdb_tableID("office") into tOfficeTableID

# first query (clients table)
put "lastName" into tDataA[tClientsTableID]["lName"]["key"]
put "=" into tDataA[tClientsTableID]["lName"]["operator"]
put "Smith" into tDataA[tClientsTableID]["lName"]["value"]

# second query (clients table)
put "firstName" into tDataA[tClientsTableID]["first_n"]["key"]
put "ends with" into tDataA[tClientsTableID]["first_n"]["operator"]
put "n" into tDataA[tClientsTableID]["first_n"]["value"]

# third query (clients table)
put "firstName" into tDataA[tClientsTableID]["first_y"]["key"]
put "ends with" into tDataA[tClientsTableID]["first_y"]["operator"]
put "y" into tDataA[tClientsTableID]["first_y"]["value"]

# advanced map (clients table)
put "lName and (first_n or first_y)" into tAdvancedMapA[tClientsTableID]

# first query (office table)
put "name" into tDataA[tOfficeTableID]"name"]["key"]
put "contains" into tDataA[tOfficeTableID]["name"]["operator"]
put "tech" into tDataA[tOfficeTableID]["name"]["value"]

# advanced map (office table)
put "name" into tAdvancedMapA[tOfficeTableID]

put "cloud" into tTarget
put "recordList" into tResultFormat

put cdb_batchAdvancedQuery(tDataA,tAdvancedMapA,tTarget,tResultFormat) into tOutputA

# output array: tOutputA[tClientsTableID] - "12345678-abcd-1234-cdef-1234567890ab\87654321-abcd-1234-cdef-1234567890ab" 
# 	       			[tOfficeTableID] - "45678123-abcd-1234-cdef-1234567890ab"
```
### Example 2:
```livecodeserver
# We want to find the number of clients that have last name "Smith"
# and the number of offices that have "tech" in their name. 

local tDataA, tAdvancedMapA, tTarget, tResultFormat, tAggregateA, tClientsTableID, tOfficeTableID, tOutputA

put cdb_tableID("clients") into tClientsTableID
put cdb_tableID("office") into tOfficeTableID

# first query (clients table)
put "lastName" into tDataA[tClientsTableID]["lName"]["key"]
put "=" into tDataA[tClientsTableID]["lName"]["operator"]
put "Smith" into tDataA[tClientsTableID]["lName"]["value"]

# advanced map (clients table)
put "lName" into tAdvancedMapA[tClientsTableID]

# aggregation (clients table)
put "lastName" into tAggregateA[tClientsTableID]["aggregateKey"]
put "Count" into tAggregateA[tClientsTableID]["aggregateFunction"]
put empty into tAggregateA[tClientsTableID]["groupby"]

# first query (office table)
put "name" into tDataA[tOfficeTableID]"name"]["key"]
put "contains" into tDataA[tOfficeTableID]["name"]["operator"]
put "tech" into tDataA[tOfficeTableID]["name"]["value"]

# advanced map (office table)
put "name" into tAdvancedMapA[tOfficeTableID]

# aggregation (office table)
put "name" into tAggregateA[tOfficeTableID]["aggregateKey"]
put "Count" into tAggregateA[tOfficeTableID]["aggregateFunction"]
put empty into tAggregateA[tOfficeTableID]["groupby"]

put "cloud" into tTarget
put "recordList" into tResultFormat

put cdb_batchAdvancedQuery(tDataA,tAdvancedMapA,tTarget,tResultFormat,tAggregateA) into tOutputA

# output array: tOutputA[tClientsTableID] - "2"
# 	       			[tOfficeTableID] - "1"
```