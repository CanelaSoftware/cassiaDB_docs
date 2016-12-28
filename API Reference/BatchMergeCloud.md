# command cdb_batchMergeCloud pInputA
---
## Summary:
This command allows for the modification of a record key's value through comparisons like "is", "is not", "is in", and "is not in". This can be done across multiple keys across multiple records across multiple tables. This occurs over the cloud.
## Inputs:
* **`pInputA`** *(Array)* - An array of one or more keys that are the table IDs of the tables being used in the merge.
    * `[tableID 1]` *(Key)* - The table ID of the first table name that is being worked with.
    	* `[recordID 1]` *(Key)* - The record ID of the first record being modified on this first table.
   			* `[yourKey 1]` *(Key)* - The user defined key that contains the data to be modified.
   				* `["value"]` *(Key)* - Key that contains the value to compare against *yourKey 1*'s value.
   				* `["operator"]` *(Key)* - Options for this key's value are: "is", "is in", "is not", "is not in". These are operators to compare "value"'s data to *yourKey 1*'s data to perform the merge.
   					* "is" - the data in the "value" key will overwrite the data in the record's *yourKey* key.
   					* "is in" - Checks the data in *yourKey* seperated by the delimiter to make sure that the data in "value" is somewhere in the data in *yourKey*, otherwise it will append it with the delimiter.
   					* "is not" - makes sure the data in *yourKey* *is not* the data in "value", otherwise it will put empty into the key. 
   					* "is not in" - Checks the data in *yourKey* seperated by the delimiter to make sure that the data in "value" is not anywhere in the data in *yourKey*, otherwise it removes it with the delimiter.
				* `["delimiter"]` *(Key)* - Reccomendations are "," or a line feed. The delimiter seperates the data in *yourKey*.
   			* `[yourKey N]` *(Key)* - Repeat *yourKey 1's* sublevel structure.
		* `[recordID N]` *(Key)* - Repeat *recordID 1*'s sublevel structure.
	* `[tableID N]` *(Key)* - Repeat *table ID 1*'s sublevel structure.

![BatchMerge input diagram](../../chartimages/batchMergeInput.png)

## Additional Requirements:
This API call requires internet access.
## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tInputA, tClientsTableID, tOfficeTableID
     
#Table name: clients											   #Table name: office
#keys: firstName, lastName, age, income							#Keys: name, address
#Record: 
#[12345678-abcd-1234-cdef-1234567890ab]["firstName"] - "John"	  #[45678123-abcd-1234-cdef-1234567890ab]["name"] - "Smith's Tech"
									   ["lastName"] - "Smith"						 					 ["address"] - "123 office Road"
                                       ["age"] - "47"
                                       ["income"] - "100000"

                                       
put cdb_getTableID("clients") into tClientsTableID                                       
put cdb_getTableID("office") into tOfficeTableID

##Update John's record
put "48" into tInputA[tClientsTableID]["12345678-abcd-1234-cdef-1234567890ab"]["age"]["value"]
put "is" into tInputA[tClientsTableID]["12345678-abcd-1234-cdef-1234567890ab"]["age"]["operator"]

##Update Smith's Tech's record
put "road" into tInputA[tOfficeTableID]["45678123-abcd-1234-cdef-1234567890ab"]["address"]["value"]
put "is not in" into tInputA[tOfficeTableID]["45678123-abcd-1234-cdef-1234567890ab"]["address"]["operator"]
put " " into tInputA[tOfficeTableID]["45678123-abcd-1234-cdef-1234567890ab"]["address"]["delimiter"]

cdb_batchMergeCloud tInputA

#The tables now look like this:
#Table name: clients											   #Table name: office
#[12345678-abcd-1234-cdef-1234567890ab]["firstName"] - "John"	  #[45678123-abcd-1234-cdef-1234567890ab]["name"] - "Smith's Tech"
									   ["lastName"] - "Smith"						 					 ["address"] - "1234 office"
                                       ["age"] - "48"
                                       ["income"] - "100000"

```
```