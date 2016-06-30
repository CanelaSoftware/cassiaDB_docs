cdb_buildQuery
==============
`function cdb_BuildQuery pKey, pOperator, pValue`

**Summary:**
This function returns a query-style array properly formatted for usage in other query-based API calls.

**Inputs:**
`pKey` *(String)* – The key in the database to search, as defined by your active schema.
`pOperator` *(String)* – The method to compare the 'key' and the 'value'.
`pValue` *(String)* – The value to compare against the contents of the 'key'.

**Outputs:**
*(Array)* – An array containing an array-formatted query, for use in other query functions.

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
Modified – 1.4

**Examples:**
-------------
```
put cdb_BuildQuery("firstName","=","Kevin") into tQueryA
get cdb_BasicQuery(tQueryA) //returns a list of all cdbRecordIDs with a firstName equal to 'Kevin'
```

```
put cdb_BuildQuery("MACAddress","regex","^([0-9A-F]{2}[:-]){5}([0-9A-F]{2})$") into tQueryA
get cdb_BasicQuery(tQueryA) //returns a list of all cdbRecordIDs with a correctly-formatted 'MACAddress'
```