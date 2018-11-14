# function cdb_advancedQuery(pInputA)
---
## Summary
This function searches the specified table using a specified logic and returns records that matches that query

## Inputs
* **pTable** *(String)* - The table name or table ID of the table to be queried.
* **pQueryA** *(Array)* - An array defining the queries
	* [query 1] *(Array)* - Key name is an arbitrary user-defined name for a query. 
		* ["key"] *(String)*- Contains the table key to be queried
		* ["value"] *(String)*- Contains the value with which to query
		* ["operator"] *(String)*- Contains the operator with which to query. (See [operators](./QueryOperators.md)).
	* \*[query N] *(Array)* - The nth query. Repeat *query 1*'s sublevel structure.
* **plogicMap** *(String)* - Defines the Logic Map used for the total query. This contains the names of the queries with AND/OR between them. Parentheses can be used to specify order of operations.
* **pTarget** *(String)* - place to query records, either "cloud" or "local"
* **pResultFormat** *(String)* - specifies the output format when returning matched records.
	- "recordList" - results are line-delimited lists of record IDs (default).
	- "recordData" - results are arrays populated with the full record data of each result.

> _*optional parameter._

> Note: To query all the records containing a specific value in ANY keys, use "\*" as value of the key "key".

![AdvancedQuery input diagram](images/AdvancedQueryInput.svg)



## Outputs
* *(String)* - If *pResultFormat* is "recordList" or if no such key is provided:
	* Output is  a line-delimited list of the recordIDs that match the query.
* *(Array)* - If *pResultFormat* is "recordData":
	* Output is an array where each key is a recordID of a record in the specified table that matches the query, with subkeys defined by the schema.

## Additional Requirements
This API call requires internet access to query data on the cloud.
	
## Example
```livecodeserver
# We want to find all clients that have first name "John" 
# and a last name that starts with "s" or "t"

local tQueryA, tLogicMap

//first query
put "firstName" into tQueryA["fname"]["key"]
put "=" into tQueryA["fname"]["operator"]
put "John" into tQueryA["fname"]["value"]

//second query
put "lastName" into tQueryA["last_s"]["key"]
put "begins with" into tQueryA["last_s"]["operator"]
put "s" into tQueryA["last_s"]["value"]

//third query
put "lastName" into tQueryA["last_t"]["key"]
put "begins with" into tQueryA["last_t"]["operator"]
put "t" into tQueryA["last_t"]["value"]

//logic map
put "fname and (last_s or last_t)" into tLogicMap

put cdb_BatchQuery("clients",tQueryA,tLogicMap,"cloud","recordList")

# outputs: 12345678-abcd-1234-cdef-1234567890ab  
# 	      87654321-abcd-1234-cdef-1234567890ab

#This is a line delimited list containing all record IDs with first name "John"
# and last name beginning with "s" or "t"
```