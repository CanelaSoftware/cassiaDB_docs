# command cdb_syncComplete pInputA
---

## Summary:
This command will sync a specified table bi-directionally between cloud and local. The end result will be a perfect match between cloud and local. New records and records with the same cdbRecordID will by synced both directions.

## Inputs:
* **`tInputA`** *(Array)* - An array that specifies which table to sync.
    * `["cdbTableName"]` *(String)* - The specified table to be synced.
  	

## Outputs:
n/a

## Additional Requirements:
This API call requires internet access.

## API Version:
* `0.3.3` - Introduced

## Examples:
```
local tInputA

#Table name: clients

#Input: tInputA
put "clients" into tInputA["cdbTableName"]
     
cdb_syncComplete tInputA

#Output: n/a 

``` 
