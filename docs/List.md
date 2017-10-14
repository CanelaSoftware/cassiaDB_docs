# function cdb_list(pInputA)
---
## Summary
This function returns a line-delimited list of the values of the requested key.

## Inputs
* **pInputA** *(Array)* - An array with the following format:
    * *["key"] *(String)* - The key whose values will be listed. Default is the cdbRecordID.
    * ["cdbTableName"] *(String)* - The name of the table to access.
    * ["cdbTarget"] *(String)* - The place to access the records, either "cloud" or "local".
    
> _*optional parameter._

## Outputs
(String) – A line-delimited list of the values of the requested key. Note that this list is unsorted.

## Additional Requirements
This API call requires internet access in order to list cloud records.

## API Version
* 0.3.1 - Introduced

## Examples
```
local tInputA, tOutputA

#Table name: clients
#Keys: firstName, lastName, age, income

put "firstName" into tInputA["key"]
put "clients" into tInputA["cdbTableName"]
put "cloud" into tInputA["cdbTarget"]

put cdb_list(tInputA) into tOutputA

#Output: John
#        Nathan
#        Erin
```