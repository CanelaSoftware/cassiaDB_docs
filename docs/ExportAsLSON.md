# command cdb_exportAsLSON pInputA
---
## Summary
This command exports a complete table (local records only) as individual documents for each record in LSON (LiveCode array encoded) format in a folder on the desktop.

## Inputs
* **pInputA** *(Array)* - An array of keys containing data per the following format:
    * ["cdbTableName"] *(String)* - The specified table name.

## Outputs
(Main storage device) – Desktop/folder/documents. 

## API Version
* 0.3.2 - Introduced

## Examples
```
local tInputA, tOutputA

#Table name: clients

#Input: tInputA
put "clients" into tInputA["cdbTableName"]
     
cdb_exportAsLSON tInputA

#Output: Folder with individual records written to the desktop. Folder name consists of "cdbTableName_cdbTableID". Records are named by their cdbRecordID.				  
```
