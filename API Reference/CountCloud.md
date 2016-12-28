# function cdb_countCloud(pTableName)
---
## Summary:
This function counts the number of cloud records in a given table.

## Inputs:
* **`pTableName`** *(String)* - The name of the table to access.

## Outputs:
(String) – Contains the numeric count of records in a given table on the cloud.

## API Version:
* `0.3.0` - Introduced

## Examples:
```
local tCount

#Table name: clients
#Keys: firstName, lastName, age, income
#Assuming there is only 1 record in the table clients

put cdb_countCloud("clients") into tCount

#Output: 1
```