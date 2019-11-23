# command cdb_exportAsLSON pTable, *pPath*
---
Updated 11/22/19
## Summary
This command exports a complete table (local records only) as a single document for all the records in LSON (LiveCode array encoded) format in a folder.

## Inputs
* **pTable** *(String)* - The name or tableID of the specified table.
* \***pPath** *(String)* - The file path location to export the LSON file. If empty, default location to export the LSON file to is the desktop.

> _*optional parameter._

## Outputs
*(Main storage device)* – A folder in the specified path or desktop that contains a single LSON file for all the records in the exported table.

## Examples
```livecodeserver
local tTable, tPath

# Table name: clients

put "clients" into tTable
put "/Users/coradoe/Documents" into tPath
     
cdb_exportAsLSON tTable, tPath

# Output:
# Folder with a single LSON file written to the user's "documents" folder. Folder name consists of 
# "cdbTableName_cdbTableID". LSON file is named by the tableID.
```
