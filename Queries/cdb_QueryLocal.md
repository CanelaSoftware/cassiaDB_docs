# cdb_QueryLocal
---
```
function cdb_QueryLocal(pQueryA)
```
## Summary:
This function searches the specified local table, and returns the subset that matches that query in several possible formats.

## Inputs:
* **`pInputA`**  *(Array)* - an array of keys containing the query, the tableName, and an optional output format.
    * `["query"]` : an array-formatted query; see cdb_BuildQuery for additional formatting information.
    	* `["key"]` (String) - The keyname to consider when querying through the records. Example: "age" to look at the age value of all records.
    	* `["value"]` (String) - The value to compare against each record's value at the key specified above.
    	* `["operator"]` (String) - The comparison operator to compare each record's value at the key specified above to the value specified above.
    - `["cdbTableName"]` : the table name or table ID to search.
    - `*["resultFormat"]` : can be "recordData" which returns an array of full records that match the query, or "recordList" (the default) which returns a line-delimited list of the recordIDs.

![alt text] (https://github.com/CanelaSoftware/cassiaDB_docs/blob/master/chartimages/QuerySimpleInput.png)

> _*optional parameter._

## Outputs: 
*(String or Array)* - Varies based on 'resultFormat' parameter; see description above.

## Examples:
-------------
```
put "transactionAmount" into tQueryA["key"]
put "25.00" into tQueryA["value"]
put ">" into tQueryA["operator"]
put tQueryA into tInputA["query"]
put "transactions" into tInputA["cdbTableName"]
get cdb_QueryLocal(tInputA) //list all cdbRecordIDs with 'transactionAmounts' greater than 25.00
```

```
put cdb_BuildQuery("firstName","=","Kevin") into tInputA["query"]
put "users" into tInputA["cdbTableName"]
put "recordData" into tInputA["resultFormat"]
get cdb_QueryLocal(tInputA) //array of all records with firstName 'Kevin' located in the "users" table
```