# cdb_updateLocal
---
```
command cdb_updateLocal tInputA
```
## Summary:
This command makes changes to a local record, without making changes to the corresponding cloud record.

## Inputs:
* **`tInputA`** *(Array)* - An array of keys containing the cdbTableName, cdbRecordID, and one or more user-defined keys. Here are the choices for key names:
    * `["cdbTableName"]` *(String)* - The specified table name.
    * `["cdbRecordID"]` *(String)* - A single cdbRecordID, or a line-delimited list of cdbRecordIDs.
    * `[`*`yourKey 1`*`]` *(String)* - User-defined key, where *yourKey1* is an arbitrary String for the key name. User must provide at least one self-defined key.
    * `*[`*`yourKey N`*`]` *(String)* - User-defined key, where *yourKeyN* is an arbitrary String for the key name. User may provide more than one if desired.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tInputA
     
put fld "recordID" into tInputA["cdbRecordID"]
put fld "firstName" into tInputA["firstName"]
put fld "lastName" into tInputA["lastName"]
put fld "age" into tInputA["age"]
put fld "income" into tInputA["income"]
put "clients" into tInputA["cdbTableName"]
     
cdb_updateLocal tInputA
```