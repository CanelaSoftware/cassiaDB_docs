# function cdb_advancedQuery(pDataA, pAdvancedMap, pTable, pTarget, *pResultFormat*, *pAggregateA*, *pRecordID*)
---
## Summary
This function searches the specified table using a specified logic and returns records that matches that query.

## Inputs
* **pDataA** *(Array)* - An array defining the queries.
	* [queryID 1] *(Array)* - Key name is an arbitrary user-defined name for a query. 
		* ["key"] *(String)* - Contains the table key to be queried.
		* ["value"] *(String)* - Contains the value with which to query.
		* ["operator"] *(String)* - Contains the operator with which to query. (See [operators](./QueryOperators.md))
	* \*[queryID N] *(Array)* - The nth query. Repeat *query 1*'s sublevel structure.
* **pAdvancedMap** *(String)* - Defines the advanced map used for the total query. This contains the names of the queries with AND/OR between them. Parentheses can be used to specify order of operations. e.g. "(query1 AND query2) OR (query3 AND query4)"
* **pTable** *(String)* - The table name or table ID of the table to be queried.
* **pTarget** *(String)* - The place to query records, either "cloud" or "local".
* \***pResultFormat** *(String)* - Specifies the output format when returning matched records.
	- "recordList" **(default)** - Results are line-delimited lists of record IDs.
	- "recordData" - Results are arrays populated with the full record data of each result.
* \***pAggregateA** *(Array)* - Array containing the following keys:
	* ["aggregateKey"] *(String)* - The name of the key to perform the aggregation on.
	* ["aggregateFunction"] *(String)* - Determines the aggregation property.
		* "avg" - The average of the values.
		* "count" - The number of occurrences of each value.
		* "min" - The minimum value.
		* "max" - The maximum value.
		* "sum" - The sum of all the values.
	* ["groupBy"] *(String)* - The name of the key whose values and their number of occurrences will be returned.
* \***pRecordID** *(String)* - Line-delimited list of record IDs or "*" for the entire table.

> _*optional parameter._

> Note: To query all the records containing a specific value in ANY keys, use "\*" as value of the key "key".

![AdvancedQueryInput](images/AdvancedQueryInput.svg)


## Outputs
* *(String)* - If *pResultFormat* is "recordList" or if no such key is provided:
	* Output is  a line-delimited list of the recordIDs that match the query.
* *(Array)* - If *pResultFormat* is "recordData":
	* Output is an array where each key is a recordID of a record in the specified table that matches the query, with subkeys defined by the schema.

## Additional Requirements
This API call requires internet access to query data on the cloud.
	
## Examples
```livecodeserver
# We want to find all clients that have last name "Smith" 
# and a first name that ends with "n" or "y".

# Table name: clients				   		
# Keys: firstName, lastName, age, income

# Records: 
# [12345678-abcd-1234-cdef-1234567890ab]["firstName"] - "John"
#							    ["lastName"] - "Smith"
#							    ["age"] - "47"
#							    ["income"] - "100000"

# [87654321-abcd-1234-cdef-1234567890ab]["firstName"] - "Jenny"
#							   ["lastName"] - "Smith"
#							   ["age"] - "46"
#							   ["income"] - "100000"

local tDataA, tAdvancedMap, tTable, tTarget, tResultFormat, tOutputA

# first query
put "lastName" into tDataA["lName"]["key"]
put "=" into tDataA["lName"]["operator"]
put "Smith" into tDataA["lName"]["value"]

# second query
put "firstName" into tDataA["first_n"]["key"]
put "ends with" into tDataA["first_n"]["operator"]
put "n" into tDataA["first_n"]["value"]

# third query
put "firstName" into tDataA["first_y"]["key"]
put "ends with" into tDataA["first_y"]["operator"]
put "y" into tDataA["first_y"]["value"]

# advanced map
put "LName and (first_n or first_y)" into tAdvancedMap

put "clients" into tTable
put "cloud" into tTarget
put "recordList" into tResultFormat

put cdb_advancedQuery(tDataA,tAdvancedMap,tTable,tTarget,tResultFormat)

# outputs: 12345678-abcd-1234-cdef-1234567890ab  
# 	       87654321-abcd-1234-cdef-1234567890ab

# This is a line delimited list containing all record IDs with last name "Smith"
# and first name ending with "n" or "y".
```