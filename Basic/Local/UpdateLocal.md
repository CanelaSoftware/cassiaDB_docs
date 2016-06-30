# cdb_updateLocal
---
```
command cdb_updateLocal pRecordA
```
## Summary:
This command makes changes to a local record, without making changes to the corresponding cloud record.

## Inputs:
* **`pRecordA`** *(Array)* - An array of keys containing the cdbTableName, cdbRecordID, and one or more user-defined keys. Here are the choices for key names:
    * `["cdbTableName"]` *(String)* - The specified table name.
    * `["cdbRecordID"]` *(String)* - A single cdbRecordID, or a line-delimited list of cdbRecordIDs.
    * `[`*`yourKey 1`*`]` *(String)* - User-defined key, where *yourKey1* is an arbitrary String for the key name. User must provide at least one self-defined key.
    * `*[`*`yourKey N`*`]` *(String)* - User-defined key, where *yourKeyN* is an arbitrary String for the key name. User may provide more than one if desired.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tRecordA,tRecordID
     
put fld "recordID" into tRecordA["cdbRecordID"]
put fld "firstName" into tRecordA["firstName"]
put fld "lastName" into tRecordA["lastName"]
put fld "age" into tRecordA["age"]
tRecordAput fld "income" into tRecordA["income"]
put "clients" into tRecordA["cdbTableName"]
     
cdb_updateLocal tRecordA
```