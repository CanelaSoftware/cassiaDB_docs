# function cdb_list(pTable, pTarget, *pKeys*, *pRecordIDs*)
---
Updated 2020/07/21

## Summary
This function returns a line-delimited string from the values of the requested key(s) or a line-delimited string of the cdbRecordIDs of all the records in the table.

## Inputs
* **pTable** *(String)* - The specified table ID or table name.
* **pTarget** *(String)* - The place to access the records, either "local" or "cloud".
* \***pKeys** *(String)* - The comma-delimited list of keys (columns).
	- _Please note: If no value for **pKeys** is provided, the default will be "cdbRecordID"._
* \***pRecordIDs** *(String)* - Use "\*" to get all the record IDs or comma-delimited list of record IDs to list specific records. If no value for **pRecordIDs** is provided, **pRecordIDs** will default to "*". 
	- _Please note: The **pRecordIDs** paramater is only effective if **pKeys** is passed a value other than "cdbRecordID"._

> \* _optional parameter_

## Outputs
* *(String)* - If **pKeys** is empty, and **pRecordIDs** is empty, a line-delimited list of the record IDs of the records in the table is returned. _This is the most efficient method for getting all of the recordIDs of a table._ Note that this list is unsorted
* *(String)* – If **pKeys** is passed a value other than "cdbRecordID", and **pRecordIDs** contains a defined list of record IDs, a line-delimited list of the values for the requested keys and record IDs are returned. Note that this list is unsorted.
* *(String)* – If **pKeys** is passed a value other than "cdbRecordID", and **pRecordIDs** = "*", a line-delimited list of all the values for the requested keys are returned. Note that this list is unsorted.

## Additional Requirements
This API call requires internet access in order to list cloud records.

## Examples
### Example 1:
```livecodeserver
local tTable, tTarget, tKeys, tOutputA

#Table name: clients
#Keys: firstName, lastName, age, income

put "clients" into tTable
put "cloud" into tTarget
put "cdbRecordID" into tKeys

# RETURN A STRING OF ALL RECORD IDS, LINE DELIMITED
# BOTH METHODS WILL RETURN THE SAME OUTPUT
# THIS IS THE MOST EFFICIENT METHOD FOR GETTING ALL RECORD IDS FROM A TABLE

#Method 1
put cdb_list(tTable,tTarget,tKeys) into tOutputA

#Method 2 (Not passing tKeys defaults to cdbRecordID)
put cdb_list(tTable,tTarget) into tOutputA

#Output: 5af2dd2f-b5b8-4178-b4d2-cbaa03b8ea23
#        634e1426-f53b-4764-a9ad-894337d910af
#        370944e4-dfaa-4d49-a0d9-e4f65ccac852
```
### Example 2:
```
local tTable, tTarget, tOutputA

#Table name: clients
#Keys: firstName, lastName, age, phoneNumber

put "clients" into tTable
put "local" into tTarget
put "firstName,lastName" into tKeys
put "5af2dd2f-b5b8-4178-b4d2-cbaa03b8ea23,634e1426-f53b-4764-a9ad-894337d910af,370944e4-dfaa-4d49-a0d9-e4f65ccac852" into tRecordIDs

# RETURN *SOME* RECORDS FOR SPECIFIED KEYS, LINE DELIMITED
put cdb_list(tTable,tTarget,tKeys,tRecordIDs) into tOutputA

#Output: Tom,Sawyer
#        Mark,Twain
#        Aunt,Polly
```
### Example 3:
```
local tTable, tTarget, tOutputA

#Table name: clients
#Keys: firstName, lastName, age, phoneNumber

put "clients" into tTable
put "local" into tTarget
put "firstName,lastName" into tKeys
put "*" into tRecordIDs

# RETURN *ALL* RECORDS FOR SPECIFIED KEYS, LINE DELIMITED
put cdb_list(tTable,tTarget,tKeys,tRecordIDs) into tOutputA

#Output: Tom,Sawyer
#        Mark,Twain
#        Aunt,Polly
#        n-firstName, n-lastName
```