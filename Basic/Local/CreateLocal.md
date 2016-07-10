# cdb_createLocal
---
```
function cdb_createLocal(pRecordA)
```
## Summary:
This function allocates a new cdbRecordID for a record locally (but not in the cloud), storing the provided data if any.

## Inputs:
* **`pRecordA`** *(Array)* - An array of keys containing the cdbTableName and one or more keys to store in a new record. Here are the choices for key names:
    * `["cdbTableName"]` *(String)* - The specified table name.
    * `[`*`yourKey 1`*`]` *(String)* - User-defined key, where *yourKey1* is an arbitrary String for the key name. User must provide at least one self-defined key.
    * `*[`*`yourKey N`*`]` *(String)* - User-defined key, where *yourKeyN* is an arbitrary String for the key name. User may provide more than one if desired.

> _*optional parameter._

## Outputs:
(String) -- Contains the allocated cdbRecordID for the new Record

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

put cdb_createLocal(tDataA) into tRecordID
```
