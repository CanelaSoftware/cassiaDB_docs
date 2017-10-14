# command cdb_delete pInputA
---
## Summary
This command deletes one or more records from the table.

## Inputs
* **pInputA** *(Array)* - An array with the following format:
    * ["cdbTableName"] *(String)* - The specified table name.
    * ["cdbTarget"] *(String)* - The place to delete the record from, either "cloud" or "local".
    * ["cdbRecordID"] *(String)* - A single cdbRecordID or a line delimited list of cdbRecordIDs to be deleted, or "*" to delete all records in a table.
    * *["cdbDoNotUseLiveCache"] *(Boolean)* - Defaults to false. If true, call will not use [livecache](Livecache.md) to back up failed call.

> _*optional parameter._

## Additional Requirements
This API call requires internet access in order to delete cloud records.

## API Version
* 0.3.0 - Introduced

## Examples
```
local tInputA

#Table name: clients
#Keys: firstName, lastName, age, income
#A single cdbRecordID: 123456abcdef

put "clients" into tInputA["cdbTableName"]
put "123456abcdef" into tInputA["cdbRecordID"]
put "cloud" into tInputA["cdbTarget"]
     
cdb_delete tInputA
```