# command cdb_batchMerge pDataA, pTarget
---
## Summary
This command allows for the modification of a record key's value through comparisons like "is", "is not", "is in", and "is not in". This can be done across multiple keys across multiple records across multiple tables.

## Inputs
* **pDataA** *(Array)* - An array of one or more keys that are the table IDs of the tables being used in the merge.
	* [tableID 1] *(Array)* - The key is the table ID, containing an array of one or more records for this table.
		* [recordID 1] *(Array)* - The key record ID of the first record being modified on this first table.
			* [keyName 1] *(Array)* - The key to be modified. Contains a sub-array with 
				* ["value"] *(String)* - the value to compare against *keyName 1*'s value.
				* ["operator"] *(String)* - Options for this key's value are: "is", "is in", "is not", "is not in". These are operators to compare "value"'s data to *keyName 1*'s data to perform the merge.
					- **"is"** - the data in the "value" key will overwrite the data in the record's *keyName* key.
					- **"is in"** - Checks the data in *keyName* seperated by the delimiter to make sure that the data in "value" is somewhere in the data in *keyName*, otherwise it will append it with the delimiter.
					- **"is not"** - makes sure the data in *keyName* *is not* the data in "value", otherwise it will put empty into the key. 
					- **"is not in"** - Checks the data in *keyName* seperated by the delimiter to make sure that the data in "value" is not anywhere in the data in *keyName*, otherwise it removes it with the delimiter.
				* ["delimiter"] *(String)* - The delimiter used to separate data inside the data in *keyName*. Recomendations are "," or lf.
			* \*[keyName N] *(Key)* - Repeat *keyName 1's* sublevel structure.
		* \*[recordID N] *(Key)* - Repeat *recordID 1*'s sublevel structure.
	* \*[tableID N] *(Key)* - Repeat *table ID 1*'s sublevel structure.

* **pTarget** *(String)* - The place to merge, either "cloud" or "local".

> \* _optional parameter_

![BatchMergeInput](images/BatchMergeInput.svg)

## Additional Requirements
This API call requires internet access.

## Examples
```livecodeserver
local tDataA, tTarget, tClientsTableID, tOfficeTableID
     
# Table name: clients						   
# Keys: firstName, lastName, age, income
# Record: 
# [12345678-abcd-1234-cdef-1234567890ab]["firstName"] - "John"
#                                       ["lastName"] - "Smith"
#                                       ["age"] - "47"
#                                       ["income"] - "100000"

# Table name: office
# Keys: name, address
# Record:
# [45678123-abcd-1234-cdef-1234567890ab]["name"] - "Smith's Tech"
#                                       ["address"] - "123 office Road"

put cdb_getTableID("clients") into tClientsTableID                                       
put cdb_getTableID("office") into tOfficeTableID

##Update John's record
put "48" into tDataA[tClientsTableID]["12345678-abcd-1234-cdef-1234567890ab"]["age"]["value"]
put "is in" into tDataA[tClientsTableID]["12345678-abcd-1234-cdef-1234567890ab"]["age"]["operator"]

##Update Smith's Tech's record
put "road" into tDataA[tOfficeTableID]["45678123-abcd-1234-cdef-1234567890ab"]["address"]["value"]
put "is not in" into tDataA[tOfficeTableID]["45678123-abcd-1234-cdef-1234567890ab"]["address"]["operator"]
put " " into tInputA[tOfficeTableID]["45678123-abcd-1234-cdef-1234567890ab"]["address"]["delimiter"]

put "cloud" into tTarget

cdb_batchMerge tDataA,tTarget

# The tables now look like this:
# Table name: clients						
# [12345678-abcd-1234-cdef-1234567890ab]["firstName"] - "John"
#                                       ["lastName"] - "Smith"
#                                       ["age"] - "48"
#                                       ["income"] - "100000"
                                       
# Table name: office
# [45678123-abcd-1234-cdef-1234567890ab]["name"] - "Smith's Tech"
#                                       ["address"] - "123 office"
```