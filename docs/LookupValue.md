# function cdb_lookUpValue(pTable, pRecordID, pKey, pTarget)
---
## Summary
This function returns the value associated with a given key for a given record.

## Inputs
* **pTable** *(String)* - The specified table name.

* **pRecordID** *(String)* - The record ID of the specified record.

* **pKey** *(String)* - The key to retrieve.

* **pTarget** *(String)* - The place to lookup the record, either "cloud" or "local".

## Outputs
(String) – The value of the given key for the specified record.

## Additional Requirements
This API call requires internet access to make cloud calls.

## Examples
```
local tTable, tRecordID, tKey, tTarget, tValue 

# Table name: clients
# Keys: firstName, lastName, age, income
# Record on the cloud in the clients table 
# with cdbRecordID "123456abcdef" and firstName "John"

put "clients" into tTable
put "123456abcdef" into tRecordID
put "firstName" into tKey
put "cloud" into tTarget
     
put cdb_lookUpValue(tTable,tRecordID,tKey,tTarget) into tValue

# Output: "John"
```