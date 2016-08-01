# cdb_createCloud
---
```
function cdb_createCloud(tInputA)
```
## Summary:
This function allocates a new cdbRecordID for a record in the cloud (but not locally), storing the provided data.

## Inputs:
* **`tInputA`** *(Array)* - An array of keys containing data per the following format:
    * `["cdbTableName"]` *(String)* - The specified table name.
    * `[`*`yourKey1`*`]` *(String)* - User-defined key, where *yourKey1* is an arbitrary String for the key name. User must provide at least one self-defined key.
    * `*[`*`yourKeyN`*`]` *(String)* - User-defined key, where *yourKeyN* is an arbitrary String for the key name. User may provide more than one if desired.

> _*optional parameter or key._

## Outputs:
(String) -- Contains the allocated cdbRecordID for the new Record

## Additional Requirements:
This API call requires internet access.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tInputA, tRecordID

put fld "firstName" into tInputA["firstName"]
put fld "lastName" into tInputA["lastName"]
put fld "age" into tInputA["age"]
put fld "income" into tInputA["income"]
put "clients" into tInputA["cdbTableName"]

put cdb_createCloud(tInputA) into tRecordID
```
