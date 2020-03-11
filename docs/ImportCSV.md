# function cdb_importCSV pTable, pTarget, pPath
---
Updated 2020/03/10
## Summary
This function imports a complete table to a local or cloud database. The requirements are that the table and schema (keys) must have been previously created. The header line in the CSV file must be the first line. The function will accept only comma-delimited data. Though, the header will support comma, semicolon, and tabs.

## Inputs
* **pTable** *(String)* - The name or tableID of the specified table.
* **pTarget** *(String)* - The place to store the imported data, either "cloud" or "local".
* **pPath** *(String)* - The file path location to import the CSV file.
 
## Outputs
*(Array)* – The output array is numerically indexed recordIDs.

## Examples
```livecodeserver
local tPath, tOutputA

# Table name: clients
# Path: /Users/mark/Desktop/Financial Sample.csv

put "clients" into tTable

answer file "Please select a CSV to import"
put it into tPath

put cdb_importCSV(tTable, "local", tPath) into tOutputA

# Output Array: 
# tOutputA[tableID][1]["2f14e03e-ec74-4fcf-8384-0c60504f8c0c"]
#                  [2]["f580f97f-30e7-4f27-a5e0-c54a988e3a8d"]
#                  [n][n-cdbRecordID]
```
