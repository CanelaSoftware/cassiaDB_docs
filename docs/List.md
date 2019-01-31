# function cdb_list(pTable, pTarget, *pKeys*)
---
## Summary
This function returns a line-delimited list of the values of the requested key(s) or a line-delimited list of the record IDs of all records in the table.

## Inputs
* **pTable** *(String)* - The specified table ID or table name.
* **pTarget** *(String)* - The place to access the records, either "cloud" or "local".
* \***pKeys** *(String)* - The comma-delimited list of keys whose values will be listed. If no value is provided, **CDBRecordID** will be listed.

> \* _optional parameter_

## Outputs
* *(String)* – If pKeys is not empty, a line-delimited list of the values of the requested key. Note that this list is unsorted.
* *(String)* - If pKeys is empty, a line-delimited list of the record IDs of the records in the table. Note that this list is unsorted.

## Additional Requirements
This API call requires internet access in order to list cloud records.

## Examples
### Example 1:
```livecodeserver
local tTable, tTarget, tKeys, tOutputA

#Table name: clients
#Keys: firstName, lastName, age, income

put "clients" into tTable
put "cloud" into tTarget
put "firstName" into tKeys

put cdb_list(tTable,tTarget,tKeys) into tOutputA

#Output: John
#        Nathan
#        Erin
```
### Example 2:
```
local tTable, tTarget, tOutputA

#Table name: clients

put "clients" into tTable
put "cloud" into tTarget

put cdb_list(tTable,tTarget) into tOutputA

#Output: 12345678-abcd-1234-cdef-1234567890ab
#        87654321-abcd-1234-cdef-1234567890ab
#        535f96c2-c08a-447d-9293-68183699a17a
```