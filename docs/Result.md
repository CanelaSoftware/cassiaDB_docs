# function cdb_result(*pParam*)
---
## Summary
Used to see if the most recently executed CDB call was successful or not.

## Inputs
* \* **pParam** *(String)* - must be one of the following, or **empty**:
	* **"completed"** *(default)* - returns a boolean value of whether the most recent CDB call completed successfully.
	* **"context"** - Returns the name of the CDB function of the most recent call.
	* **"response"** - Returns the error message associated with the most recent call, if any.
	* **"date"** - Returns the datetime of the most recent call.
	* **"recent"** - Returns an array with all of the above data.
	* **"log"** - Returns a log of recent CDB function calls.

> \* _optional parameter_
	
## Outputs
Depending on the input parameter:
* (Boolean) - if **"completed"** or **empty** is passed.
* (String) - if **"context"**, **"response"**, **"date"**, or **"log"** is passed.
* (Array) - if **"recent"** is passed.


## Examples
```
# Table "clients" exists

put cdb_read("clients","12345678-abcd-1234-cdef-1234567890ab") into tRecordID

put cdb_result()
# Output: "false"

put cdb_result("context")
# Output: "cdb_create"

put cdb_result("response")
# Output: "You must provide either 'local' or 'cloud' as the parameter pTarget."

put cdb_read("clients","12345678-abcd-1234-cdef-1234567890ab","local") into tRecordID

put cdb_result()
# Output: "true"

put cdb_result("response")
# Output: empty
```
