# function cdb_lookUpValue(pInputA)
---
## Summary
This function returns the value associated with a given key for a given cloud record.

## Inputs
* **`pInputA`** *(Array)* - An array with the following format:
    * `["cdbTableName"]` *(String)* - The specified table name.
    * `["cdbRecordID"]` *(String)* - The record ID of the specified record.
    * `["cdbTarget"]` *(String)* - The place to lookup the record, either `"cloud"` or `"local"`.
    * `["key"]` *(String)* - The key to retrieve.

## Outputs
*(String)* – The value of the given key for the specified record.

## Additional Requirements
This API call requires internet access to make cloud calls.

## API Version
* `0.3.1` - Introduced

## Examples
```
local tInputA, tValue 

# Table name: clients
# Keys: firstName, lastName, age, income
# Record on the cloud in the clients table 
# with cdbRecordID "123456abcdef" and firstName "John"

put "clients" into tInputA["cdbTableName"]
put "123456abcdef" into tInputA["cdbRecordID"]
put "cloud" into tInputA["cdbTarget"]
put "firstName" into tInputA["key"]
     
put cdb_lookUpValue(tInputA) into tValue

# Output: "John"
```