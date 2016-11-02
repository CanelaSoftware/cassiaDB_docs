# cdb_batchMergeCloud
---
```
command cdb_batchMergeCloud pInputA
```
## Summary:
This command allows for the modification of a record key's value through comparisons like "is", "is not", "is in", and "is not in". This can be done across multiple keys across multiple records across multiple tables. This occurs over the cloud.

## Inputs:
* **`pInputA`** *(Array)* - An array of one or more keys that are the table IDs of the tables being used in the merge.
    * `[`*`tableID 1`*`]` *(String)* - The table ID of the first table name that is being worked with.
    	* `[`*`recordID 1`*`]` *(String)* - The record ID of the first record being modified on this first table.
   			* `[`*`yourKey 1`*`]` *(String)* - The user defined key in above the record that contains the data to be modified.
   				* `["value"]` *(String)* - Key that contains the value to compare against *yourKey 1*'s value.
   				* `["operator"]` *(String)* - Options for this key's value are: "is", "is in", "is not", "is not in". These are operators to compare "value"'s data to *yourKey 1*'s data to perform the merge.
   					* "is" - the data in the "value" key will overwrite the data in the record's *yourKey* key.
   					* "is in" - Checks the data in *yourKey* seperated by the delimiter to make sure that the data in "value" is somewhere in the data in *yourKey*, otherwise it will append it with the delimiter.
   					* "is not" - makes sure the data in *yourKey* *is not* the data in "value", otherwise it will put empty into the key. 
   					* "is not in" - Checks the data in *yourKey* seperated by the delimiter to make sure that the data in "value" is not anywhere in the data in *yourKey*, otherwise it removes it with the delimiter.
				* `["delimiter"]` *(String)* - Reccomendations are "," or a line feed. The delimiter seperates the data in *yourKey*.
   			* `[`*`yourKey N`*`]` *(String)* - Repeat *yourKey 1's* sublevel structure.
		* `[`*`recordID N`*`]` *(String)* - Repeat *recordID 1*'s sublevel structure.
	* `[`*`tableID N`*`]` *(String)* - Repeat *table ID 1*'s sublevel structure.

![BatchMerge input diagram](../chartimages/batchMergeInput.png)

## API Version:
* `0.3.1` - Introduced

## Additional Requirements:
* Must have internet access to perform this command.

## Examples:
```
local tInputA, tRecordID, tTableID

put fld "recordID data" into tRecordID
put cdb_getTableID("clients") into tTableID

put "Mark" into tInputA[tTableID][tRecordID]["firstName"]["value"]
put "is not in" into tInputA[tTableID][tRecordID]["firstName"]["operator"]
put "," into tInputA[tTableID][tRecordID]["firstName"]["delimiter"]

put "Talluto" into tInputA[tTableID][tRecordID]["lastName"]["value"]
put "is" into tInputA[tTableID][tRecordID]["lastName"]["operator"]
put "," into tInputA[tTableID][tRecordID]["lastName"]["delimiter"]

cdb_batchMergeCloud tInputA
```
