# function cdb_count(pTable, pTarget)
---
## Summary
This function counts the number of records (either cloud or local) in a given table.

## Inputs
* **pTable** *(String)* - The specified table ID or table name.

* **pTarget** *(String)* - The place to count the records from, either "cloud" or "local".

## Outputs
*(String)* – Contains the numeric count of records in a given table.

## Additional Requirements
This API call requires internet access in order to count cloud records.

## Examples
```livecodeserver
local tCount, tTable, tTarget

# Table name: clients
# Keys: firstName, lastName, age, income
# There is only 1 record in the table clients on the cloud

put "clients" into tTable
put "cloud" into tTarget

put cdb_count(tTable,tTarget) into tCount

# Output: 1
```