# function cdb_readCloud(pInputA)
---
## Summary:
This function downloads the most recent version of one or more cloud records, and returns them as an array without updating the local record.

## Inputs:
* **`pInputA`** *(Array)* - An array of keys containing data per the following format:
    * `["cdbTableName"]` *(String)* - The specified table name
    * `["cdbRecordID"]` *(String)* - A single cdbRecordID or a line delimited list of 

## Outputs:
(2D Array) - One or more records with keys as defined by the schema of the accessed database. 

## Additional Requirements:
This API call requires internet access.

## API Version:
* `0.3` - Introduced

## Examples:
```
local tInputA, tDataA

#Table name: clients
#Keys: firstName, lastName, age, income
#A single cdbRecordID: 123456abcdef

put "123456abcdef" into tInputA["cdbRecordID"]
put "clients" into tInputA["cdbTableName"]
    
put cdb_readCloud(tInputA) into tDataA
#Output: tDataA["123456abcdef"]["cdb"] - metadata
							   ["firstName"] - value
							   ["lastName"] - value
							   ["age"] - value
							   ["income"] - value
```