# command cdb_exportAsJSON pTable, *pPath*
---
## Summary
This command exports a complete table (local records only) as a single document for all the records in JSON format in a folder.

## Inputs
* **pTable** *(String)* - The name or tableID of the specified table.
* \***pPath** *(String)* - The file path location to export the JSON file. If empty, default location to export the JSON file to is the desktop.

> _*optional parameter._
 
## Outputs
*(Main storage device)* – A folder in the specified path or desktop that contains a single JSON file for all the records in the exported table.

## Examples
```livecodeserver
local tTable, tPath

# Table name: clients

put "clients" into tTable
put "/Users/coradoe/Documents" into tPath
     
cdb_exportAsJSON tTable, tPath

# Output: 
# Folder with a single JSON file written to the user's "documents" folder. Folder name consists of 
# "cdbTableName_cdbTableID". JSON file is named by the table name.
```
