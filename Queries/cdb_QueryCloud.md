

**Summary:**  
This function searches the specified cloud table, and returns the subset that matches that query in several possible formats.

**Inputs:**  
pInputA -
    - "query" : required, an array-formatted query; see cdb_BuildQuery for additional formatting information
    - "cdbTableName" : required, the table name or table ID to search
    - "resultFormat" : optional, can be "recordData" which returns an array of full records that match the query, or "recordList" (the default) which returns a line-delimited list of the recordIDs.

**Outputs:**  
*(String or Array)* - Varies based on 'resultFormat' parameter; see description above.


**Examples:**
-------------
```
put "transactionAmount" into tQueryA["key"]
put "25.00" into tQueryA["value"]
put ">" into tQueryA["operator"]
put tQueryA into tInputA["query"]
put "transactions" into tInputA["cdbTableName"]
get cdb_QueryCloud(tInputA) //list all cdbRecordIDs with 'transactionAmounts' greater than 25.00
```

```
put cdb_BuildQuery("firstName","=","Kevin") into tInputA["query"]
put "users" into tInputA["cdbTableName"]
put "recordData" into tInputA["resultFormat"]
get cdb_QueryCloud(tInputA) //array of all records with firstName 'Kevin' located in the "users" table
```