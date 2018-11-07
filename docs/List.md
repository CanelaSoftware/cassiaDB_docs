# function cdb_list(pTable, pKeys, pTarget)
---
## Summary
This function returns a line-delimited list of the values of the requested key.

## Inputs
* pTable *(String)* - The specified table ID or table name.
* pKeys *(String)* - The comma-delimited list of keys whose values will be listed.
* pTarget *(String)* - The place to access the records, either "cloud" or "local".

## Outputs
(String) – A line-delimited list of the values of the requested key. Note that this list is unsorted.

## Additional Requirements
This API call requires internet access in order to list cloud records.

## Examples
```
local tTable, tKeys, tTarget

#Table name: clients
#Keys: firstName, lastName, age, income

put "clients" into tTable
put "firstName" into tKeys
put "cloud" into tTarget

put cdb_list(tInputA) into tOutputA

#Output: John
#        Nathan
#        Erin
```