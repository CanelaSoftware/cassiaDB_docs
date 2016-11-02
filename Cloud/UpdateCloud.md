# cdb_updateCloud
---
```
command cdb_updateCloud pInputA
```
## Summary:
This command makes changes to an existing cloud record without modifying the corresponding local record.

## Inputs:
* **`pInputA`** *(Array)* - An array of keys containing data per the following format:
    * `["cdbTableName"]` *(String)* - The specified table name.
    * `["cdbRecordID"]` *(String)* - A single cdbRecordID.
    * `[`*`yourKey1`*`]` *(String)* - User-defined key, where *yourKey1* is an arbitrary String for the key name. User must provide at least one self-defined key.
    * `*[`*`yourKeyN`*`]` *(String)* - User-defined key, where *yourKeyN* is an arbitrary String for the key name. User may provide more than one if desired.

## Additional Requirements:
* This API call requires internet access.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tInputA
     
#Table name and recordID
put "clients" into tInputA["cdbTableName"]     
put "123456abcdef" into tInputA["cdbRecordID"]

#One or more keys
put "Tom" into tInputA["firstName"]
put "Jerry" into tInputA["lastName"]
put "31" into tInputA["age"]
put "31000" into tInputA["income"]
     
cdb_updateCloud tInputA
```