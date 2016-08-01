# cdb_listLocal
---
```
function cdb_listLocal(tInputA)
```
## Summary:
This function returns a line-delimited list of the values of the requested key.

## Inputs:
* **`tInputA`** *(Array)* - An array of keys containing data per the following format:
    * `*["keyList"]` *(String)* - The key whose values will be listed. Default is the cdbRecordID.
    * `*["sortType"]` *(String)* - The type of sort to apply to the results, from the following options:
       * `"text"` - sorts alphabetically.
       * `"numeric"` - sorts numerically.    
       * `"dateTime"` - sorts by the date and/or time.
       * `empty` *(default)* - does not sort. 
    * `*["sortDirection"]` *(String)* - The direction to sort the results, from the following options:
          * `"ascending"` *(default)* - sorts from smallest to largest.
          * `"descending"` - sorts from largest to smallest.
    * `["cdbTableName"]` *(String)* - The label of the database to access.
    
> _*optional parameter._

## Outputs:
(String) – A line-delimited list of the values of the requested key.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tInputA,tDataA

put empty into tInputA["keyList"]
put empty into tInputA["sortType"]
put empty into tInputA["sortDirection"]
put "clients" into tInputA["cdbTableName"]

put cdb_listLocal(tInputA) into tDataA
```