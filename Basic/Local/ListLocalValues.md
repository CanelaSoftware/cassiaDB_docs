# cdb_listLocalValues
---
```
function cdb_listLocalValues(tInputA)
```
## Summary:
This function returns a line-delimited list of the values of the requested key.

## Inputs:
* **`tInputA`** *(Array)* - An array of keys containing the cdbTableName and a number of optional keys. Here are the choices for key names:
    * `*["keyList"]` *(String)* - The key whose values will be listed.
    * `*["sortType"]` *(String)* - The type of sort to apply to the results, from the following options:
       * `'text'` - sorts by the ASCII value of each character.  
       * `'numeric'` - sorts by the ASCII value of each character.    
       * `'dateTime'` - sorts by the date and/or time.
       * `empty` - sorts 'text' if a sortDirection is provided, otherwise does not sort. 
    * `*["sortDirection"]` *(String)* - The direction to sort the results, from the following options:
          * `'ascending'` - sorts from smallest to largest.
          * `'descending'` - sorts from largest to smallest.
    * `["cdbTableName"]` *(String)* - The label of the database to access.
    
> _*optional parameter._

## Outputs:
(String) – A line-delimited list of the values of the requested key.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tData, tInputA

put empty into tInputA["keyList"]
put empty into tInputA["sortType"]
put empty into tInputA["sortDirection"]
put "clients" into tInputA["cdbTableName"]

put cdb_listLocalValues(tInputA) into tData
```