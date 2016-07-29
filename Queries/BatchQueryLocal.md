# cdb_BatchQueryLocal
---
```
function cdb_BatchQueryLocal(tInputA)
```
## Summary:
This function searches the specified local table(s), and returns the subset that matches that query in several possible formats.

## Inputs:
* **`tInputA`** *(Array)* - An array of one or two keys that specify the batch query and the query settings.
	* `["batchQuery"]` *(String)* - An array of one or more table IDs to be queried upon.
  		* `[`*`tableID 1`*`]` *(String)* - An array of one or more queries for this table.
  			* `[`*`query 1`*`]` *(String)* - An arbitrary user-defined key for a query. Recommended keys are 1, 2, ..., N, where N is the number of stored records in the table with a UUID of *tableID 1*. This is a key to a properly formatted query with keys, "key" "value" and "operator". [Click here] (https://github.com/CanelaSoftware/cassiaDB_docs/blob/master/chartimages/QueryOps.png) to see available operators to use in the query.
  			* `*[`*`query N`*`]` *(String)* - The nth query for *tableID 1*. Repeat *query 1*'s sublevel structure.
 		* `*[`*`tableID N`*`]` *(String)* - An array of one or mdore queries for this table. Repeat *table ID 1*'s sublevel structure.
	* `*["settings"]` *(String)* - An array of keys that can be set to produce different output forms.
 		* `*["mode"]` *(String)* - Key that specifies how to logically combine the queries when returning each query's appropriate records. Here are options for this key's value-
 			- "logicalAND" - records which match ALL of the provided queries are returned; results are combined into a single query key.
 			- "logicalOR" - record which match ANY of the provided queries are returned; results are combined into a single query key.
 			- "batch" - each query is executed independently of the others, with distinct results (default).
 		* `*["resultFormat"]` *(String)* - Key that specifies the output format when returning matched records.
 			- "recordList" - results are line-delimited lists of record IDs (default).
 			- "recordData" - results are arrays populated with the full record data of each result.
 		* `*["collapseArray"]` *(String)* - Key that specifies how to deal with array levels in the the result that only contain one key (such as a single table name, or a single query)
 			- true - the array is elided from the result.
 			- false - the array maintains the original structure (default).

![alt text] (https://github.com/CanelaSoftware/cassiaDB_docs/blob/master/chartimages/QueryBatchInput.png)

> _*optional parameter._

## Outputs:
* *(Array)* - (the following structure assumes that collapseArray is 'false')
	* `[`*`tableID 1`*`]` - The first tableID containing each query for that table.
		* `[`*`query 1`*`]` - contains the results as specified in the 'resultFormat'.
		* `[`*`query N`*`]` - contains the results as specified in the 'resultFormat' when the 'mode' is not "logicalAND" or "logicalOR".
	* `[`*`tableID N`*`]` - as above, if queries were executed on multiple tables at once.
	
## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tTableID, tInputA

//gets the table ID
put cdx_getTableID("transactions") into tTableID

//first query
put "transactionAmount" into tInputA["batchQuery"][tTableID][1]["key"]
put ">" into tInputA["batchQuery"][tTableID][1]["operator"]
put "25.00" into tInputA["batchQuery"][tTableID][1]["value"]

//second query
put "firstName" into tInputA["batchQuery"][tTableID][2]["key"]
put "=" into tInputA["batchQuery"][tTableID][2]["operator"]
put "Kevin" into tInputA["batchQuery"][tTableID][2]["value"]

//settings
put "recordData" into tInputA["settings"]["resultFormat"]
put "true" into tInputA["settings"]["collapseArray"]

get cdb_BatchQueryLocal(tInputA)
```