# function cdb_read(pInputA)
---
## Summary
This function reads one or more records from either local or cloud, and returns them as an array.

## Inputs
* **`pInputA`** *(Array)* - An array with the following format:
    * `["cdbTableName"]` *(String)* - The specified table name
    * `["cdbTarget"]` *(String)* - The place to access the records, either `"cloud"` or `"local"`.
    * `["cdbRecordID"]` *(String)* - A single record ID or a line-delimited list of record IDs, or `"*"` for all records
    
## Outputs
(Array) - One or more records with keys as defined by the schema of the accessed database. This includes a key `"cdb"`, which holds [metadata](metadata.md)

## Additional Requirements
This API call requires internet access to make cloud calls.

## API Version
* `0.3.0` - Introduced

## Examples
```
local tInputA, tDataA

#Table name: clients
#Keys: firstName, lastName, age, income
#A single cdbRecordID: 123456abcdef

put "123456abcdef" into tInputA["cdbRecordID"]
put "clients" into tInputA["cdbTableName"]
put "cloud" into tInputA["cdbTarget"]
    
put cdb_read(tInputA) into tDataA
#Output: tDataA["123456abcdef"]["cdb"] - metadata
#							   ["firstName"] - value
#							   ["lastName"] - value
#							   ["age"] - value
#							   ["income"] - value
```