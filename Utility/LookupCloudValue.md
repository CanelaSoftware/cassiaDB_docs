# cdb_lookUpCloudValue
---
```
function cdb_lookUpCloudValue tInputA
```
## Summary:
This function returns the value associated with a given key for a given record that's on the cloud.

## Inputs:
* **`tInputA`** *(Array)* - An array of one key containing the cdbTableName.
    * `["cdbTableName"]` *(String)* - The specified table name to get the schema for.
    * `["cdbRecordID"]` *(String)* - the cdbRecordID of the record to examine.
    * `["key"]` *(String)* - the key to retrieve.

## Outputs:
*(String)* – Contains the value of the given key for the specified record.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tInputA 

put fld "workingTableName data" into tInputA["cdbTableName"]
put line 1 of fld "recordID data" into tInputA["cdbRecordID"]
put "firstName" into tInputA["key"]
     
put cdb_lookUpCloudValue(tInputA) into tValue
```