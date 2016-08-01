# cdb_result
---
```
function cdb_result(pParam)
```
## Summary:
Used to check the status of the most recently executed CDB call.

## Inputs:
* pParam *(String)* -
	* `empty` *(default)* - returns a boolean value of whether the most recent CDB call completed successfully.
	* `"array"` - Returns an array with all logged values about the most recent call.
	* `"context"` - Returns the name of the most recent call.
	* `"response"` - Returns the error message associated with the most recent call, if any.

	
## Outputs:
Depending on the input parameter -

* (String) *(default)* - A boolean value of whether the most recent CDB call completed successfully.
* (Array) - When `"array"` is the input, an array with all logged values about the most recent call.
* (String) - When `"context"` is the input, the name of the most recent call.
* (String) - When `"response"` is the input, the error message associated with the most recent call, if any.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tDataA, tRecordID

...

put cdb_createLocal(tDataA) into tRecordID
     
if not cdb_result() then
	put "Error, create failed"
end if
```