# command cdb_deleteCloud pInputA
---
## Summary:
This command deletes one or more records from the cloud table (but not from local).

## Inputs:
* **`pInputA`** *(Array)* - An array with the following format:
    * `["cdbTableName"]` *(String)* - The specified table name.
    * `["cdbRecordID"]` *(String)* - A single cdbRecordID or a line delimited list of cdbRecordIDs to be deleted, or `"*"` to delete all records in a table. 

## Additional Requirements:
This API call requires internet access.

## API Version:
* `0.3.0` - Introduced

## Examples:
```
local tInputA

#Table name: clients
#Keys: firstName, lastName, age, income
#A single cdbRecordID: 123456abcdef

put "clients" into tInputA["cdbTableName"]
put "123456abcdef" into tInputA["cdbRecordID"]
     
cdb_deleteCloud tInputA
```