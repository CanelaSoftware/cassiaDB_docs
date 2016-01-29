# AdvancedCloudQuery
---
```
function cdb_AdvancedCloudQuery(pQuerySetA, pLogicMap, pClientDatabaseName, pOutputFormat)
```
## Summary:
This function searches the specified database using the provided queries, applies one or more logical operations against the results, and returns the resulting subset of data.

## Inputs:
* **`pQuerySetA[]`** - A multidimensional array with one (or more) query objects.
  * **_`["1"]`_** - A query object; see cdb_BuildQuery for more information.
    * **`["key"]`** - The key to search in (haystack).
    * **`["operator"]`** - The operator to apply.
    * **`["value"]`** - The value to search for (needle).
* **`pLogicMap`** - The order and method by which the queries' results are combined. Possible operators are:
  * `"AND"` - Intersection of the results of the specified queries.
  * `"OR"` - Union of the results of the specified queries.
* _`*pClientDatabaseName`_ - The label of the database to access, or the working database if empty.
* _`*pOutputFormat`_ - The output format to use, chosen from the following options:
  * `"recordList"` - A line-delimited list of the matching cdbRecordIDs. (This is the default value.)
  * `"basic"` - A multidimensional array of all user-defined keys.
  * `"advanced"` - A multidimensional array of all keys, including internal keys.

## Outputs:
Output varies based on `pOutputFormat`; see description above.

## API Version:
* `1.0` - Introduced
* `1.4` - Last Modified

## Examples:
```
put cdb_BuildQuery("firstName","=","Mark") into tQuerySetA["A"]
put cdb_BuildQuery("lastName","=","Miller") into tQuerySetA["B"]
put cdb_BuildQuery("lastName","=","Stevens") into tQuerySetA["C"]
get cdb_AdvancedLocalQuery(tQuerySetA,"((A AND B) OR (A AND C))","Users","recordList") //list all users named 'Mark Miller' or 'Mark Stevens'
```
