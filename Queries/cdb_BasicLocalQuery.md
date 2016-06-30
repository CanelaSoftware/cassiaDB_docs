cdb_basicLocalQuery
======================
`function cdb_BasicLocalQuery pQueryA, pClientDatabasename, pOutputFormat`

**Summary:**  
This function searches the specified local database, and returns the subset that matches that query in several possible formats.

**Inputs:**  
`pQueryA` *(Array)* - The search query; see “Query Syntax” below.  
`pClientDatabaseName`\* *(String)* - The label of the database to access, or the working database if empty.  
`pOutputFormat`\* *(String)* - The output format to use, from the following options:
* `recordList` - A line-delimited String of the matching cdbRecordIDs. (This is the default if no format is provided.)
* `structured` - A multidimensional Array of parsed, expanded database information.

**Outputs:**  
*(String or Array)* - Varies based on 'pOutputFormat' parameter; see description above.

**Query Syntax:**
Queries are formatted as an array containing the following keys:
`key` – The key in the database to search, as defined by your active schema
`value` – The value to compare against the contents of the 'key'
`operator` – The method to compare the 'key' and the 'value':
* `is in` – A key's contents contains the 'value'
* `is not in` – A key's contents does not contain the 'value'
* `is` – A key's contents is equal to the 'value'
* `is not` – A key's contents is not equal to the 'value'
* `starts with` – A key's contents begins with the 'value'
* `ends with` – A key's contents ends with the 'value'
* `regex` – A key's contents matches the 'value' regular expression
* `>` – A key's contents are greater than the 'value' (non-numeric contents are ignored)
* `<` – A key's contents are less than the 'value' (non-numeric contents are ignored)
* `>=` – A key's contents are greater than or equal to the 'value' (non-numeric contents are ignored)
* `<=` – A key's contents are less than or equal to the 'value' (non-numeric contents are ignored)

**API Version:**  
Introduced – 1.0  
Modified - 1.4

\* *optional parameter*

**Examples:**
-------------
```
put "transactionAmount" into tQueryA["key"]
put "25.00" into tQueryA["value"]
put ">" into tQueryA["operator"]
get cdb_BasicLocalQuery(tQueryA) //list all cdbRecordIDs with 'transactionAmounts' greater than 25.00
```

```
put cdb_BuildQuery("firstName","=","Kevin") into tQueryA
get cdb_BasicLocalQuery(tQueryA,,"structured") //structured array of all cdbRecordIDs with firstName 'Kevin' located in the current working database
```