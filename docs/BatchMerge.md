# command cdb_batchMerge pDataA, pTarget, *pInternalA*
---
## Summary
This command allows for the modification of a record's key's value through comparisons like "is", "is not", "is in", and "is not in". This can be done across multiple keys across multiple records across multiple tables.

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
				* ["delimiter"] *(String)* - The delimiter used to separate data inside the data in *keyName*. Recomendations are "," or lf. The default delimiter is ",".
			* \*[keyName N] *(Key)* - Repeat *keyName 1's* sublevel structure.
		* \*[recordID N] *(Key)* - Repeat *recordID 1*'s sublevel structure.
	* \*[tableID N] *(Key)* - Repeat *table ID 1*'s sublevel structure.

* **pTarget** *(String)* - The place to merge, either "cloud" or "local".

* \***pInternalA** *(Array)* - An array whose key is "delaySend" and its value is true. Optional parameter if pTarget is "cloud." This will delay processing the cloud call and will store its transaction in "cdbCache." Use [cdb_flushCache](FlushCache.md) to process the delayed transactions.

> \* _optional parameter_

![BatchMergeInput](images/BatchMergeInput.svg)

## Additional Requirements
This API call requires internet access in order to merge cloud records.

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
#                                       ["address"] - "123 Office Road"

put cdb_tableID("clients") into tClientsTableID                                       
put cdb_tableID("office") into tOfficeTableID

# Update John's record
put "48" into tDataA[tClientsTableID]["12345678-abcd-1234-cdef-1234567890ab"]["age"]["value"]
put "is in" into tDataA[tClientsTableID]["12345678-abcd-1234-cdef-1234567890ab"]["age"]["operator"]

# Update Smith's Tech's record
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
#                                       ["address"] - "123 Office"
```

```livecodeserver
local tDataA, tTarget, tInternalA, tClientsTableID, tOfficeTableID

# Table name: clients						   
# Keys: firstName, lastName, age, income
# Record: 
# [32165478-wxyz-7890-cdef-6544567890ty]["firstName"] - "Cora"
#                                       ["lastName"] - "Doe"
#                                       ["age"] - "35"
#                                       ["income"] - "100000"

# Table name: office
# Keys: name, address
# Record:
# [98778124-idfd-6544-efgf-8744532890po]["name"] - "Doe's Electronics"
#                                       ["address"] - "456 Office Road"

put cdb_tableID("clients") into tClientsTableID                                       
put cdb_tableID("office") into tOfficeTableID

# Update Cora's record
put "110000" into tDataA[tClientsTableID]["32165478-wxyz-7890-cdef-6544567890ty"]["income"]["value"]
put "is in" into tDataA[tClientsTableID]["32165478-wxyz-7890-cdef-6544567890ty"]["income"]["operator"]

# Update Doe's Electronics' record
put "electronics" into tDataA[tOfficeTableID]["98778124-idfd-6544-efgf-8744532890po"]["name"]["value"]
put "is not in" into tDataA[tOfficeTableID]["98778124-idfd-6544-efgf-8744532890po"]["name"]["operator"]
put " " into tInputA[tOfficeTableID]["98778124-idfd-6544-efgf-8744532890po"]["name"]["delimiter"]

put "cloud" into tTarget
put true into tInternalA["delaySend"]

cdb_batchMerge tDataA,tTarget,tInternalA

# Process the delayed transaction
cdb_flushCache

# The tables now look like this:
# Table name: clients						
# [32165478-wxyz-7890-cdef-6544567890ty]["firstName"] - "Cora"
#                                       ["lastName"] - "Doe"
#                                       ["age"] - "35"
#                                       ["income"] - "110000"
                                       
# Table name: office
# [98778124-idfd-6544-efgf-8744532890po]["name"] - "Doe's"
#                                       ["address"] - "456 Office Road"
```