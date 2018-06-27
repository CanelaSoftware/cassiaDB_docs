# function cdb_count(pInputA)
---
## Summary
This function counts the number of records (either cloud or local) in a given table.

## Inputs
* **pInputA** *(Array)* - Array with the following format:
	* ["cdbTableName"] *(String)* - The specified table name.
    * ["cdbTarget"] *(String)* - The place to count the records from, either "cloud" or "local".

## Outputs
(String) – Contains the numeric count of records in a given table.

## Additional Requirements
This API call requires internet access in order to count cloud records.

## API Version
* 0.3.0 - Introduced

## Examples
```
local tCount, tInputA

# Table name: clients
# Keys: firstName, lastName, age, income
# There is only 1 record in the table clients on the cloud

put "clients" into tInputA["cdbTableName"]
put "cloud" into tInputA["cdbTarget"]

put cdb_count(tInputA) into tCount

# Output: 1
```