# AdvancedCloudQuery
---
```
function cdb_AdvancedCloudQuery(pQuerySetA, pLogicMap, pClientDatabaseName, pOutputFormat)
```
## Summary:
###### This function searches the specified database using the provided queries, applies one or more logical operations against the results, and returns the resulting subset of data.

## Inputs:
* **`pQuerySetA[]`** - Multidimensional array.
  * **_`[queryLabel]`_** - One (or more) query objects.
    * **`["key"]`** - The key to search in (haystack).
    * **`["operator"]`** - The operator to apply.
    * **`["value"]`** - The value to search for (needle).
* **`pLogicMap`** - The order and method by which the queries' results are combined.
* `*pClientDatabaseName` - The label of the database to access, or the working database if empty.
* `*pOutputFormat` - The output format to use, chosen from the following options:
  * **`"recordList"`** - A line-delimited list of the matching cdbRecordIDs. (This is the default value.)
  * `"basic"` - A multidimensional array of all user-defined keys.
  * `"advanced"` - A multidimensional array of all keys, including internal keys.
