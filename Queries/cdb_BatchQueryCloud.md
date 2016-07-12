

**Summary:**  
This function searches the specified cloud table, and returns the subset that matches that query in several possible formats.

**Inputs:**  
pInputA -
	["batchQuery"]
   		[table id 1] (required)
  		 		[query 1] (required)
  		 		[query 2] (optional)
  		 		[query N] (optional)
 	    [table id 2] (optional)
 	    [table id N] (optional)
 	["settings"] (optional)
 		["mode"] (optional)
 			- "logicalAND" : records which match ALL of the provided queries are returned; results are combined into a single query key
 			- "logicalOR" : record which match ANY of the provided queries are returned; results are combined into a single query key
 			- "batch" : each query is executed independently of the others, with distinct results (default)
 		["resultFormat"] (optional)
 			- "recordList" : results are line-delimited lists of record IDs (default)
 			- "recordData" : results are arrays populated with the full record data of each result
 		["collapseArray"] (optional)
 			- true : any array levels in the result that contain only one key (such as a single table name, or a single query) are elided from the result
 			- false : the array maintains the original structure (default)

**Outputs:**  
(Array) (the following structure assumes that collapseArray is 'false')
	[table id 1]
		[query 1] : contains the results as specified in the 'resultFormat'
		[query N] : contains the results as specified in the 'resultFormat' when the 'mode' is not "logicalAND" or "logicalOR"
	[table id N] : as above, if queries were executed on multiple tables at once


**Examples:**
-------------
```
put cdb_BuildQuery("transactionAmount",">","25.00") into tInputA[cdx_getTableID("transactions")][1]
put cdb_BuildQuery("firstName","=","Kevin") into tInputA[cdx_getTableID("users")][1]
put "recordData" into tInputA["settings"]["resultFormat"]
put "true" into tInputA["settings"]["collapseArray"]
get cdb_BatchQueryCloud(tInputA)
```