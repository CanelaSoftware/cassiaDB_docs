# command cdb_setUploadMethod *pMethod*

---
Updated 11/22/19
## Summary
This command controls the upload method used for cloud calls.

## Inputs
* \***pMethod** *(String)*:
	* "async" **(default)** - Cloud calls are sent in an asynchronous manner. Asynchronous calls will generally result in better performance, but the order of data being sent cannot be guaranteed.
	* "sync" - Cloud calls are sent in a synchronous manner. The APIs will wait for confirmation that the transaction was received before proceeding with the next transaction.


> _*optional parameter._


## Examples
```livecodeserver
# We want to set cloud calls to upload in a synchronous manner.

local tMethod

put "sync" into tMethod

cdb_setUploadMethod tMethod
```