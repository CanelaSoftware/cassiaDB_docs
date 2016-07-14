# cdb_QueryCloud
---
```
function cdb_QueryCloud(tQueryA)
```
## Summary:
This function searches the specified cloud table, and returns the subset that matches that query in several possible formats.

## Inputs:
* **`tInputA`**  *(Array)* - An array of keys containing the query, the tableName, and an optional output format.
	* `["query"]` *(String)* - An array-formatted query; see cdb_BuildQuery for additional formatting information.
    	* `["key"]` *(String)* - The key name to consider when querying through the records. Example- "age" to look at the age value of all records.
    	* `["value"]` *(String)* - The value to compare against each record's value at the key specified above.
    	* `["operator"]` *(String)* - The comparison operator to compare each record's value at the key specified above to the value specified above.
    - `["cdbTableName"]` *(String)* - The table name or table ID to search through.
    - `*["resultFormat"]` *(String)* - Can be "recordData" which returns an array of full records that match the query, or "recordList" (the default) which returns a line-delimited list of the recordIDs.

![alt text] (https://github.com/CanelaSoftware/cassiaDB_docs/blob/master/chartimages/QuerySimpleInput.png)

> _*optional parameter._

## Outputs:
* *(Array)* - If *pInputA["resultFormat"]* is "recordList" or if no such key is provided:
	* Output is  a line-delimited list of the recordIDs that match the query.
* *(Array)* - If *pInputA["resultFormat"]* is "recordData":
	* Output is an array of full records that match the query.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tQueryA, tInputA

put "transactionAmount" into tQueryA["key"]
put "25.00" into tQueryA["value"]
put ">" into tQueryA["operator"]
put tQueryA into tInputA["query"]
put "transactions" into tInputA["cdbTableName"]
get cdb_QueryCloud(tInputA) //list all cdbRecordIDs with 'transactionAmounts' greater than 25.00
```

```
local tInputA

put cdb_BuildQuery("firstName","=","Kevin") into tInputA["query"]
put "users" into tInputA["cdbTableName"]
put "recordData" into tInputA["resultFormat"]
get cdb_QueryCloud(tInputA) //array of all records with firstName 'Kevin' located in the "users" table
```