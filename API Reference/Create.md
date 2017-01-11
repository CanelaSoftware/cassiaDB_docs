# function cdb_create(pInputA)
---
## Summary:
This function allocates a new cdbRecordID for a record in either the cloud or locally, storing the provided data.

## Inputs:
* **`pInputA`** *(Array)* - An array with the following format:
    * `["cdbTableName"]` *(String)* - The specified table name.
    * `["cdbTarget"]` *(String)* - The place to create the record, either `"cloud"` or `"local"`.
    * `[`*`yourKey1`*`]` *(String)* - A Key as defined by the table's schema ([see getTableKeys](./cdb_getTableKeys.md)). User must provide at least one key.
    * `*[`*`yourKeyN`*`]` *(String)* - A Key as defined by the table's schema ([see getTableKeys](./cdb_getTableKeys.md)).

> _*optional parameter or key._

## Outputs:
(String) - The allocated cdbRecordID for the new record.

## Additional Requirements:
This API call requires internet access.

## API Version:
* `0.3.0` - Introduced

## Examples:
```
#Table name: clients
#Keys: firstName, lastName, age, income

put "John" into tInputA["firstName"]
put "Doe" into tInputA["lastName"]
put "20" into tInputA["age"]
put "30000 into tInputA["income"]
put "clients" into tInputA["cdbTableName"]
put "cloud" into tInputA["cdbTarget"]

put cdb_create(tInputA) into tRecordID
#tRecordID now contains the ID of the created record: 123456abcdef

#Error handling
if not cdb_result() then
	answer cdb_result("response")
end if
```
