# function cdb_lookUpCloudValue(pInputA)
---
## Summary:
This function returns the value associated with a given key for a given record that's on the cloud.

## Inputs:
* **`pInputA`** *(Array)* - An array of keys containing data per the following format:
    * `["cdbTableName"]` *(String)* - The specified table name.
    * `["cdbRecordID"]` *(String)* - The record ID of the specified record.
    * `["key"]` *(String)* - The key to retrieve.

## Outputs:
*(String)* – Contains the value of the given key for the specified record.

## API Version:
* `0.3` - Introduced

## Examples:
```
local tInputA, tValue 

#Table name: clients
#Keys: firstName, lastName, age, income
#Assuming there is 1 record in the clients table with firstName John

put "clients" into tInputA["cdbTableName"]
put "123456abcdef" into tInputA["cdbRecordID"]
put "firstName" into tInputA["key"]
     
put cdb_lookUpCloudValue(tInputA) into tValue

#Output: John
```