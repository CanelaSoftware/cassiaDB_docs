# function cdb_createLocal(pInputA)
---
## Summary:
This function allocates a new cdbRecordID for a record locally (but not in the cloud), storing the provided data.

## Inputs:
* **`pInputA`** *(Array)* - An array of keys containing data per the following format:
    * `["cdbTableName"]` *(String)* - The specified table name.
    * `[`*`yourKey1`*`]` *(String)* - User-defined key, where *yourKey1* is an arbitrary String for the key name. User must provide at least one self-defined key.
    * `*[`*`yourKeyN`*`]` *(String)* - User-defined key, where *yourKeyN* is an arbitrary String for the key name. User may provide more than one if desired.

> _*optional parameter._

## Outputs:
(String) -- Contains the allocated cdbRecordID for the new Record.

## API Version:
* `0.3` - Introduced

## Examples:
```
local tInputA, tRecordID

#Table name: clients
#Keys: firstName, lastName, age, income

put "John" into tInputA["firstName"]
put "Doe" into tInputA["lastName"]
put "20" into tInputA["age"]
put "30000 into tInputA["income"]
put "clients" into tInputA["cdbTableName"]

#tRecordID now contains the ID of the created record
put cdb_createLocal(tInputA) into tRecordID
#Output: 123456abcdef
```
