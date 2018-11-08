# command cdb_exportAsLSON pTable, *pPath*
---
## Summary
This command exports a complete table (local records only) as individual documents for each record in LSON (LiveCode array encoded) format in a folder.

## Inputs
* **pTable** *(String)* - The name or tableID of the specified table.

* \***pPath** *(String)* - The location of the exported table. (Desktop is chosen by default if no path is provided)

> _*optional parameter._

## Outputs
(Main storage device) – A folder in the specified location (or desktop by default) that contains LSON files for each record in the exported table.

## Examples
```
local tTable, tPath

# Table name: clients

put "clients" into tTable
     
cdb_exportAsLSON tTable

# Output:
# Folder with individual records written to the desktop. Folder name consists of "cdbTableName_cdbTableID". Records are named by their cdbRecordID.
```
