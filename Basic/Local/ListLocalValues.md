# ListLocalValues
---
```
function cdb_listLocalValues(pArrayA)
```
## Summary:
This function returns a line-delimited list of the values of the requested key.

## Inputs:
* **`pArrayA`** *(Array)* - An array containing the cdbTableName. the keyList.
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
local tData, tArrayA

put empty into tArrayA["keyList"]
put empty into tArrayA["sortType"]
put empty into tArrayA["sortDirection"]
put "clients" into tArrayA["cdbTableName"]

put cdb_listLocalValues(tArrayA) into tData
```