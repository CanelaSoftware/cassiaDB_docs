# function cdb_readLocal(pInputA)
---
## Summary:
This function reads one ore more local records and returns the records' contents.

## Inputs:
* **`pInputA`** *(Array)* - An array with the following format:
    * `["cdbTableName"]` *(String)* - The specified table name
    * `["cdbRecordID"]` *(String)* - A single record ID or a line-delimited list of record IDs, or `"*"` for all records

## Outputs:
(Array) - keys are recordIDs, with child keys as defined by the table.

## API Version:
* `0.3.0` - Introduced

## Examples:
```
local tInputA, tDataA

#Table name: clients
#Keys: firstName, lastName, age, income
#cdbRecordIDs: 123456abcdef, 123xyz

put "123456abcdef" into tInputA["cdbRecordID"]
put "clients" into tInputA["cdbTableName"]

put cdb_readLocal(tInputA) into tDataA
#Output: tDataA["123456abcdef"]["cdb"] - metadata
							   ["firstName"] - John
							   ["lastName"] - Smith
							   ["age"] - 54
							   ["income"] - 500000
#Error handling
if not cdb_result() then
	answer cdb_result("response")
end if

put "123456abcdef" & lf & "123xyz" into tInputA["cdbRecordID"]
put "clients" into tInputA["cdbTableName"]

put cdb_readLocal(tInputA) into tDataA
#Output: tDataA["123456abcdef"]["cdb"] - metadata
							   ["firstName"] - John
							   ["lastName"] - Smith
							   ["age"] - 54
							   ["income"] - 500000
			        ["123xyz"]["cdb"] - metadata
							  ["firstName"] - Erin
							  ["lastName"] - Lee
							  ["age"] - 41
							  ["income"] - 500000
#Error handling
if not cdb_result() then
	answer cdb_result("response")
end if

```