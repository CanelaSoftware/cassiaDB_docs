# function cdb_importJSON pTable, pTarget, pPath
---
Updated 2020/03/12
## Summary
This function imports JSON data to a local or cloud database. The table and schema (keys) must have been previously created. You may import one or more JSON files at the same time.

## Inputs
* **pTable** *(String)* - The name or tableID of the specified table.
* **pTarget** *(String)* - The place to store the imported data, either "cloud" or "local".
* **pPath** *(String)* - The file path location to import the JSON file.
 
## Outputs
*(Array)* – The output array is numerically indexed recordIDs.

## Examples
```livecodeserver
local tPath, tOutputA

# Table name: clients
# Path: /Users/linda/Desktop/Customer List.json

put "clients" into tTable

answer files "Please select one or more JSON files to import"
put it into tPath

put cdb_importJSON(tTable, "local", tPath) into tOutputA

# Output Array: 
# tOutputA[tableID][1]["2f14e03e-ec74-4fcf-8384-0c60504f8c0c"]
#                  [2]["f580f97f-30e7-4f27-a5e0-c54a988e3a8d"]
#                  [n][n-cdbRecordID]
```
