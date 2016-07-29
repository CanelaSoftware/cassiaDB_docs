# cdb_result
---
```
function cdb_result(pParam)
```
## Summary:
Used after calling a number of cdb functions. Indicates if the cdb library failed.

## Inputs:
* pParam - can either be empty or have the value of "response"

## Outputs:
(String) - A boolean value indicating whether the call was successful or not.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tDataA, tRecordID

...

put cdb_createLocal(tDataA) into tRecordID
     
if not cdb_result() then put "Error:" && cdb_result("response") & lf & lf after fld "data"
```