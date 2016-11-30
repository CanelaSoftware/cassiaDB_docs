# function cdb_BatchQueryCloud(pInputA)
---
## Summary:
This function searches the specified table(s) over the cloud, and returns the subset that matches that query in several possible formats.

## Inputs:
* **`pInputA`** *(Array)* - An array of one or two keys that specify the batch query and the query settings.
	* `["batchQuery"]` *(Key)* - An array of one or more table IDs to be queried upon.
  		* `[tableID 1]` *(Key)* - An array of one or more queries for this table.
  			* `[query 1]` *(Key)* - An arbitrary user-defined key for a query. Recommended keys are 1, 2, ..., N, where N is the number of stored records in the table with a UUID of *tableID 1*. This is a key to a properly formatted query with keys: "key" "value" and "[operator](../../Basic/QueryOperators.md)" which map to desired String values to be queried.
  			* `*[query N]` *(Key)* - The nth query for *tableID 1*. Repeat *query 1*'s sublevel structure.
 		* `*[tableID N]` *(Key)* - An array of one or mdore queries for this table. Repeat *table ID 1*'s sublevel structure.
	* `*["settings"]` *(Key)* - An array of keys that can be set to produce different output forms.
 		* `*["mode"]` *(Key)* - Key that specifies how to logically combine the queries when returning each query's appropriate records. Here are options for this key's value-
 			- "logicalAND" - records which match ALL of the provided queries are returned; results are combined into a single query key.
 			- "logicalOR" - record which match ANY of the provided queries are returned; results are combined into a single query key.
 			- "batch" - each query is executed independently of the others, with distinct results (default).
 		* `*["resultFormat"]` *(Key)* - Key that specifies the output format when returning matched records.
 			- "recordList" - results are line-delimited lists of record IDs (default).
 			- "recordData" - results are arrays populated with the full record data of each result.
 		* `*["collapseArray"]` *(Key)* - Key that specifies how to deal with array levels in the the result that only contain one key (such as a single table name, or a single query)
 			- true - the array is elided from the result.
 			- false - the array maintains the original structure (default).

![BatchQuery input diagram](../../chartimages/QueryBatchInput.png)

> _*optional parameter._

> Note: To query all the records containing a specific value in ANY keys, use "\*" as value of the key "key".

## Outputs:
* *(Array)* - (the following structure assumes that collapseArray is 'false')
	* `[tableID 1]` - The first tableID containing each query for that table.
		* `[query 1]` - contains the results as specified in the 'resultFormat'.
		* `[query N]` - contains the results as specified in the 'resultFormat' when the 'mode' is not "logicalAND" or "logicalOR".
	* `[tableID N]` - as above, if queries were executed on multiple tables at once.

## Additional Requirements:
This API call requires internet access.
	
## API Version:
* `0.3.1` - Introduced

## Examples:

```
#Table name: clients											   #Table name: office
#keys: firstName, lastName, age, income							#Keys: name, address
#Record: 
#[12345678-abcd-1234-cdef-1234567890ab]["firstName"] - "John"	  #[45678123-abcd-1234-cdef-1234567890ab]["name"] - "Smith's Tech"
									   ["lastName"] - "Smith"						 					["address"] - "123 office Road"
                                       ["age"] - "47"
                                       ["income"] - "100000"
 [87654321-abcd-1234-cdef-1234567890ab]["firstName"] - "Jenny"
									   ["lastName"] - "Smith"
                                       ["age"] - "46"
                                       ["income"] - "100000"
```
###Example 1:
```
local tInputA, tOutputA, tClientsTableID, tOfficeTableID
                                       
put cdb_getTableID("clients") into tClientsTableID                                       
put cdb_getTableID("office") into tOfficeTableID

//first query
put "*" into tInputA["batchQuery"][tClientsTableID][1]["key"]
put "~" into tInputA["batchQuery"][tClientsTableID][1]["operator"]
put "Smith" into tInputA["batchQuery"][tClientsTableID][1]["value"]

//second query
put "address" into tInputA["batchQuery"][tOfficeID][1]["key"]
put "=" into tInputA["batchQuery"][tOfficeID][1]["operator"]
put "abbey road" into tInputA["batchQuery"][tOfficeID][1]["value"]

//settings
put "recordlist" into tInputA["settings"]["resultFormat"] 

put cdb_BatchQueryCloud(tInputA) into tOutputA

#output array: tOutputA[tClientsTableID][1] - 12345678-abcd-1234-cdef-1234567890ab  //This is a line delimited list
											  87654321-abcd-1234-cdef-1234567890ab
```
### Example 2:
```
//first query
put "age" into tInputA["batchQuery"][tClientsTableID][1]["key"]
put ">=" into tInputA["batchQuery"][tClientsTableID][1]["operator"]
put "47" into tInputA["batchQuery"][tClientsTableID][1]["value"]

//second query
put "lastName" into tInputA["batchQuery"][tClientsTableID][2]["key"]
put "=" into tInputA["batchQuery"][tClientsTableID][2]["operator"]
put "Smith" into tInputA["batchQuery"][tClientsTableID][2]["value"]

//third query
put "address" into tInputA["batchQuery"][tOfficeID][1]["key"]
put "=" into tInputA["batchQuery"][tOfficeID][1]["operator"]
put "123 office Road" into tInputA["batchQuery"][tOfficeID][1]["value"]

//settings
put "recordData" into tInputA["settings"]["resultFormat"] 
put "logicalAND" into tInputA["settings"]["mode"]
put cdb_BatchQueryCloud(tInputA) into tOutputA

#output array: tOutputA[tClientsTableID][1]["12345678-abcd-1234-cdef-1234567890ab"]["firstName"] - "John"	 
									    										 ["lastName"] - "Smith"						 					
                                       										  ["age"] - "47"
                                       										  ["income"] - "100000"
                       [tOfficeTableID][1]["45678123-abcd-1234-cdef-1234567890ab"]["name"] - "Smith's Tech"
                       														   ["address"] - "123 office Road"
```