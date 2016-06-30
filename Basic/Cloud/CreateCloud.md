# cdb_createCloud
---
```
function cdb_createCloud(pRecordA)
```
## Summary:
This function allocates a new cdbRecordID for a record in the cloud (but not locally), storing the provided data if any.

## Inputs:
* **`pRecordA`** *(Array)* - An array of keys containing the cdbTableName and one or more keys to store in a new record. Here are the choices for key names:
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
local tData, tRecordID

put fld "firstName" into tDataA["firstName"]
put fld "lastName" into tDataA["lastName"]
put fld "age" into tDataA["age"]
put fld "income" into tDataA["income"]
put "clients" into tDataA["cdbTableName"]

put cdb_createCloud(tDataA) into tRecordID
```
