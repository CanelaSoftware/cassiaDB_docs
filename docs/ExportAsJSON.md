# command cdb_exportAsJSON pTable
---
## Summary
This command exports a complete table (local records only) as individual documents for each record in JSON format in a folder.

## Inputs
* **pTable** *(String)* - The name or tableID of the specified table.

## Outputs
(Main storage device) – A folder in the desktop that contains JSON files for each record in the exported table.

## Examples
```livecodeserver
local tTable

# Table name: clients

put "clients" into tTable
     
cdb_exportAsJSON tTable

# Output: 
# Folder with individual records written to the desktop. Folder name consists of 
# "cdbTableName_cdbTableID". Records are named by their cdbRecordID.
```
