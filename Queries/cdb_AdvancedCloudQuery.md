cdb_AdvancedCloudQuery
===
`function cdb_AdvancedCloudQuery pQuerySetA, pLogicMap, pClientDatabasename, pOutputFormat`

**Summary:**
This function searches the specified cloud database using provided queries, applies the logical operations detailed in the pLogicMap, and returns the resulting subset in several possible formats.

**Inputs:**
`pQuerySetA` *(Array)* - A set of one or more search queries; each query's key should be a single word, and correspond to one (or more) in the pLogicMap.
`pLogicMap` *(String)* - The order and method in which the queries' results are combined.
`pClientDatabaseName`\* *(String)* - The label of the database to access, or the working database if empty.
`pOutputFormat`\* *(String)* - The output format to use, from the following options:
* `recordList` - A line-delimited String of the matching cdbRecordIDs. (This is the default if no format is provided.)
* `structured` - A multidimensional Array of parsed, expanded database information.

**Outputs:**
*(String or Array)* - Varies based on 'pOutputFormat' parameter; see description above.

**Logic Map Syntax:**
The logic map is formatted as a String that can be parenthetically nested, with the following logical set operations:
* 'AND' - The intersection of the results.
* 'OR' - The union of the results.
* 'XOR' - The symmetric difference of the results.

**API Version:**
Introduced – 1.5

**Examples:**
---
```
//list all users named 'Mark Miller' or 'Mark Stevens'
put cdb_BuildQuery("firstName","=","Mark") into tQuerySetA["AllMarks"]
put cdb_BuildQuery("lastName","=","Miller") into tQuerySetA["AllMillers"]
put cdb_BuildQuery("lastName","=","Stevens") into tQuerySetA["AllStevens"]
get cdb_AdvancedCloudQuery(tQuerySetA,"((AllMarks AND AllMillers) OR (AllMarks AND AllStevens))","Users","recordList")
```