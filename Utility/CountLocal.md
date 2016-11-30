# fucntion cdb_countLocal(pTableName)
---
## Summary:
This function counts the number of unique records in a given table.

## Inputs:
* **`pTableName`** *(String)* - The label of the table to access.

## Outputs:
(String) – Contains the numeric count of records in a given table.

## API Version:
* `0.3` - Introduced

## Examples:
```
local tCount

#Table name: clients
#Keys: firstName, lastName, age, income
#Assuming there is only 1 record in the table clients

put cdb_countLocal("clients") into tCount

#Output: 1
```