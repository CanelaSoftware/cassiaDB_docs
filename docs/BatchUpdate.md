# command cdb_batchUpdate pDataA, pTarget
---
## Summary
This command makes changes to a number of records. It can access multiple tables.

## Inputs
* **pDataA** *(Array)* - A multidimensional array of keys, where each key is a tableID that maps to another array of keys. There must be at least one tableID key in this array.
    * [tableID 1] *(Key)* - Key is the first table's ID, maps to subarray of record IDs. There must be at least one record key in this sub-array.
    	* [cdbRecordID 1] *(Key)* - key that is the cdbRecordID of the first record to be updated. 
    		* [keyName 1] *(Key)* - User-defined keyname corresponding to a value of the record to be udpated. User must provide at least one self-defined keyname.
    			*  value - The new value for the corresponding key.
    		* \*[keyName N] *(Key)* - The nth user-defined keyname. Repeat *keyName 1*'s sublevel structure.
    			*  value - The new value for the corresponding key.
    	* \*[cdbRecordID N] *(Key)* - The nth record key. Repeat *cdbRecordID 1*'s sublevel structure.
    * \*[tableID N] *(Key)* - key that is the nth table's UID. Repeat *tableID 1*'s sublevel structure.

* **pTarget** *(String)* - The place to udpate the record, either "cloud" or "local".

> _*optional parameter._

![Update Input Diagram](images/BatchUpdateInput.svg)
## Additional Requirements
This API call requires internet access.

## Examples
```livecodeserver
local tDataA, tTarget, tClientsTableID, tOfficeTableID
     
# Table name: clients						
# Keys: firstName, lastName, age, income	

# Records: 
# [12345678-abcd-1234-cdef-1234567890ab]["firstName"] - "John"
# [12345678-abcd-1234-cdef-1234567890ab]["lastName"] - "Smith"
# [12345678-abcd-1234-cdef-1234567890ab]["age"] - "47"
# [12345678-abcd-1234-cdef-1234567890ab]["income"] - "100000"
                                       
# [87654321-abcd-1234-cdef-1234567890ab]["firstName"] - "Jenny"
# [87654321-abcd-1234-cdef-1234567890ab]["lastName"] - "Smith"
# [87654321-abcd-1234-cdef-1234567890ab]["age"] - "46"
# [87654321-abcd-1234-cdef-1234567890ab]["income"] - "100000"
                                       
# Table name: office
# Keys: name, address

# Records:
# [45678123-abcd-1234-cdef-1234567890ab]["name"] - "Smith's Tech"
# [45678123-abcd-1234-cdef-1234567890ab]["address"] - "123 office road"
                                       
put cdb_tableID("clients") into tClientsTableID                                       
put cdb_tableID("office") into tOfficeTableID

## Update John's record
put "48" into tDataA[tClientsTableID]["12345678-abcd-1234-cdef-1234567890ab"]["age"]

## Update Jenny's record
put "47" into tDataA[tClientsTableID]["87654321-abcd-1234-cdef-1234567890ab"]["age"]
put "110000" into tDataA[tClientsTableID]["87654321-abcd-1234-cdef-1234567890ab"]["income"]

## Update Smith's Tech's record
put "1234 office road" into tDataA[tOfficeTableID]["45678123-abcd-1234-cdef-1234567890ab"]["address"]

put "cloud" into tTarget

cdb_batchUpdate tDataA,tTarget

# The tables now look like this:

# Table name: clients						
# [12345678-abcd-1234-cdef-1234567890ab]["firstName"] - "John"
# [12345678-abcd-1234-cdef-1234567890ab]["lastName"] - "Smith"
# [12345678-abcd-1234-cdef-1234567890ab]["age"] - "48"
# [12345678-abcd-1234-cdef-1234567890ab]["income"] - "100000"
                                       
# [87654321-abcd-1234-cdef-1234567890ab]["firstName"] - "Jenny"
# [87654321-abcd-1234-cdef-1234567890ab]["lastName"] - "Smith"
# [87654321-abcd-1234-cdef-1234567890ab]["age"] - "47"
# [87654321-abcd-1234-cdef-1234567890ab]["income"] - "110000"

# Table name: office
# [45678123-abcd-1234-cdef-1234567890ab]["name"] - "Smith's Tech"
# [45678123-abcd-1234-cdef-1234567890ab]["address"] - "1234 office road"
```