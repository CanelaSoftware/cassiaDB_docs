# function cdb_create(pInputA)
---
## Summary
This function allocates a new cdbRecordID for a record in either the cloud or locally, storing the provided data.

## Inputs
* **pInputA** *(Array)* - An array with the following format:
    * ["cdbTableName"] *(String)* - The name of the table where the record should be created.
    * ["cdbTarget"] *(String)* - The place to create the record, either "cloud" or "local".
    * \*["cdbDoNotUseLiveCache"] *(Boolean)* - If true, will stop using [livecache](Livecache.md).
    * [*yourKey1*] *(String)* - The value for one of the new record's keys. *yourKey1* must be one of the table's keys. ([see getTableKeys](GetTableKeys.md)). At least one key must be provided.
    * \*[*yourKeyN*] *(String)* - The value for the new record's *yourKeyN* key.

> *_optional parameter._


## Outputs
(String) - The allocated cdbRecordID for the new record.

## Additional Requirements
This API call requires internet access in order to create cloud records.

## API Version
* 0.3.0 - Introduced

## Examples
```
#Table name: clients
#Keys: firstName, lastName, age, income

put "John" into tInputA["firstName"]
put "Doe" into tInputA["lastName"]
put "20" into tInputA["age"]
put "30000" into tInputA["income"]
put "clients" into tInputA["cdbTableName"]
put "cloud" into tInputA["cdbTarget"]

put cdb_create(tInputA) into tRecordID
#tRecordID now contains the ID of the created record: 123456abcdef

#Error handling
if not cdb_result() then
	answer cdb_result("response")
end if
```
