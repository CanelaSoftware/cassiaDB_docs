# command cdb_syncComplete pInputA
---

## Summary
This command will sync a specified table bi-directionally between cloud and local. The end result will be a perfect match between cloud and local. Unique records are synced to the target. Records with the same cdbRecordID will have their cdbRecordVersion compared. The newer version will be synced to the target.

## Inputs
* **`tInputA`** *(Array)* - An array that specifies which table to sync.
    * `["cdbTableName"]` *(String)* - The specified table to be synced.

## Additional Requirements
* This API call requires internet access.

## API Version
* `0.3.3` - Introduced

## Examples
```
local tInputA

# Table name: clients

# Input: tInputA
put "clients" into tInputA["cdbTableName"]
     
cdb_syncComplete tInputA

# 

``` 
