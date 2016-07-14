# cdb_BatchQueryLocal
---
```
function cdb_BatchQueryLocal(pInputA)
```
## Summary:
This function searches the specified local table, and returns the subset that matches that query in several possible formats.

## Inputs:
* **`pInputA`** *(Array)* - an array of one or two keys that specify the batch query and the query settings.
	* `["batchQuery"]` *(String)* - an array of one or more table IDs to be queried upon.
  		* `[`*`tableID 1`*`]` *(String)* - an array of one or more queries for this table.
  			* `[`*`query 1`*`]` *(String)* - An arbitrary user-defined key for a query. Recommended keys are 1, 2, ..., N, where N is the number of stored records in the table with a UUID of *tableID 1*. This is a key to a properly formatted query with keys, "key" "value" and "operator".
  			* `*[`*`query N`*`]` *(String)* - The nth query for *tableID 1*. Repeat *query 1*'s sublevel structure.
 		* `*[`*`tableID N`*`]` *(String)* - an array of one or mdore queries for this table. Repeat *table ID 1*'s sublevel structure.
	* `*["settings"]` *(String)* - an array of 
 		* `*["mode"]` *(String)* - key that specifies how to logically combine the queries when returning each query's appropriate records. Here are options for this key's value:
 			- "logicalAND" : records which match ALL of the provided queries are returned; results are combined into a single query key
 			- "logicalOR" : record which match ANY of the provided queries are returned; results are combined into a single query key
 			- "batch" : each query is executed independently of the others, with distinct results (default)
 		* `*["resultFormat"]` *(String)* - key that specifies the output format when returning matched records.
 			- "recordList" : results are line-delimited lists of record IDs (default)
 			- "recordData" : results are arrays populated with the full record data of each result
 		* `*["collapseArray"]` *(String)*
 			- true : any array levels in the result that contain only one key (such as a single table name, or a single query) are elided from the result
 			- false : the array maintains the original structure (default)

![alt text] (https://github.com/CanelaSoftware/cassiaDB_docs/blob/master/chartimages/QueryBatchInput.png)

> _*optional parameter._

## Outputs:
(Array) (the following structure assumes that collapseArray is 'false')
	[table id 1]
		[query 1] : contains the results as specified in the 'resultFormat'
		[query N] : contains the results as specified in the 'resultFormat' when the 'mode' is not "logicalAND" or "logicalOR"
	[table id N] : as above, if queries were executed on multiple tables at once


## Examples:
```
put cdb_BuildQuery("transactionAmount",">","25.00") into tInputA[cdx_getTableID("transactions")][1]
put cdb_BuildQuery("firstName","=","Kevin") into tInputA[cdx_getTableID("users")][1]
put "recordData" into tInputA["settings"]["resultFormat"]
put "true" into tInputA["settings"]["collapseArray"]
get cdb_BatchQueryLocal(tInputA)
```