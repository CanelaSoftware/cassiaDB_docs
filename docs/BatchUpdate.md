# command cdb_batchUpdate pInputA
---
## Summary
This command makes changes to a number of records. It can access multiple tables.

## Inputs
* **`pInputA`** *(Array)* - A multidimensional array of keys, where each key is a table UID that maps to another array of keys. This table UID can be obtained by calling the function *cdb_getTableID* and passing in the table name, returns the table's unique UID. There must be at least one table UID key in this array.
    * `["cdbTarget"]` *(String)* - place to update records, either `"cloud"` or `"local"`
    * `[tableID 1]` *(Key)* - key that is the first table's UID, which maps to another array of arbitrary record keys. There must be at least one record key in this sub-array.
    	* `[cdbRecordID 1]` *(Key)* - key that is the record UUID for the first record wanting to be updated. 
    		* `[keyName 1]` *(Key)* - User-defined keyname, where *keyName 1* is an arbitrary key name. Each keyname maps to the actual user data to update. User must provide at least one self-defined keyname.
    			*  `yourData` *(String)* - the actual data the user wants to update in this keyname in this record in this table.
    		* `*[keyName N]` *(Key)* - The nth user-defined keyname. Repeat *keyName 1*'s sublevel structure.
    	* `*[cdbRecordID N]` *(Key)* - The nth record key. Repeat *recordKey 1*'s sublevel structure.
    * `*[tableID N]` *(Key)* - key that is the nth table's UID. Repeat *tableID 1*'s sublevel structure.

> _*optional parameter._



![Update Input Diagram](images/BatchUpdateInput.svg)
## Additional Requirements
This API call requires internet access.
## API Version
* `0.3.1` - Introduced

## Examples
```
local tInputA, tClientsTableID, tOfficeTableID
     
#Table name: clients											   #Table name: office
#keys: firstName, lastName, age, income							#Keys: name, address
#Record: 
#[12345678-abcd-1234-cdef-1234567890ab]["firstName"] - "John"	  #[45678123-abcd-1234-cdef-1234567890ab]["name"] - "Smith's Tech"
									   ["lastName"] - "Smith"						 					 ["address"] - "123 officeRoad"
                                       ["age"] - "47"
                                       ["income"] - "100000"
 [87654321-abcd-1234-cdef-1234567890ab]["firstName"] - "Jenny"
									   ["lastName"] - "Smith"
                                       ["age"] - "47"
                                       ["income"] - "100000"
                                       
put cdb_getTableID("clients") into tClientsTableID                                       
put cdb_getTableID("office") into tOfficeTableID

##Update John's record
put "48" into tInputA[tClientsTableID]["12345678-abcd-1234-cdef-1234567890ab"]["age"]

##Update Jenny's record
put "46" into tInputA[tClientsTableID]["87654321-abcd-1234-cdef-1234567890ab"]["age"]
put "99999" into tInputA[tClientsTableID]["87654321-abcd-1234-cdef-1234567890ab"]["income"]

##Update Smith's Tech's record
put "1234 office road" into tInputA[tOfficeTableID]["45678123-abcd-1234-cdef-1234567890ab"]["address"]

put "cloud" into tInputA["cdbTarget"]

cdb_batchUpdate tInputA

#The tables now look like this:
#Table name: clients											   #Table name: office
#[12345678-abcd-1234-cdef-1234567890ab]["firstName"] - "John"	  #[45678123-abcd-1234-cdef-1234567890ab]["name"] - "Smith's Tech"
									   ["lastName"] - "Smith"						 					 ["address"] - "1234 officeRoad"
                                       ["age"] - "48"
                                       ["income"] - "100000"
 [87654321-abcd-1234-cdef-1234567890ab]["firstName"] - "Jenny"
									   ["lastName"] - "Smith"
                                       ["age"] - "46"
                                       ["income"] - "99999"
```
```