# function cdb_listLocal(pInputA)
---
## Summary:
This function returns a line-delimited list of the values of the requested key.

## Inputs:
* **`pInputA`** *(Array)* - An array of keys containing data per the following format:
    * `*["keyList"]` *(String)* - The key whose values will be listed. Default is the cdbRecordID.
    * `["cdbTableName"]` *(String)* - The label of the database to access.
    
> _*optional parameter._

## Outputs:
(String) – A line-delimited list of the values of the requested key.

## API Version:
* `0.3` - Introduced

## Examples:
```
local tInputA, tOutputA

#Table name: clients
#Keys: firstName, lastName, age, income

put empty into tInputA["key"]
put "clients" into tInputA["cdbTableName"]

put cdb_listLocal(tInputA) into tOutputA

#Output: 123456abcdef
```