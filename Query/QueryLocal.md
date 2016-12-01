# function cdb_QueryLocal(pInputA)
---
## Summary:
This function searches the specified local table, and returns the subset that matches that query in several possible formats.

## Inputs:
* **`pInputA`**  *(Array)* - An array of keys containing the query, the table name, and an optional output format.
	* `["query"]` *(Key)* - An array formatted as follows:
    	* `["key"]` *(String)* - One of the following:
    		- `yourKey` - Searches the specified key
    		- `"$"` - Searches all schema-defined keys
    		- `"*"` - Searches all schema-defined keys and internal keys.
    	* `["value"]` *(String)* - The value to compare against each record's value at the key specified above.
    	* `["operator"]` *(String)* - The [comparison operator](../QueryOperators.md) to compare each record's value at the key specified above to the value specified above.
    - `["cdbTableName"]` *(String)* - The table name or table ID to search through.
    - `*["resultFormat"]` *(String)*:
    	-  `"recordList"` *(default)* - returns a line-delimited list of the recordIDs that match the query.
    	- `"recordData"` - returns an array of full records that match the query.

![Query input diagram](../chartimages/QuerySimpleInput.png)

> _*optional parameter._

## Outputs:
* *(String)* - If *pInputA["resultFormat"]* is "recordList" or if no such key is provided:
	* Output is  a line-delimited list of the recordIDs that match the query.
* *(Array)* - If *pInputA["resultFormat"]* is "recordData":
	* Output is an array where each key is a recordID that matches the query, with subkeys defined by the schema.

## API Version:
* `0.3` - Introduced

## Examples:
```
local tQueryA, tInputA, tOutputA

#Table name: clients
#Keys: firstName, lastName, age, income

#Construct "query" array
put "firstName" into tQueryA["key"]
put "John" into tQueryA["value"]
put "=" into tQueryA["operator"]

#Set up the input array
put tQueryA into tInputA["query"]
put "clients" into tInputA["cdbTableName"]

#recordData output format
put "recordData" into tInputA["resultFormat"]
#OR
#recordList output format
put "recordList" into tInputA["resultFormat"]

put cdb_QueryCloud(tInputA) into tOutputA

#recordData Output: tOutputA[123456abcdef]["cdb"] - metadata
					  	       ["firstName"] - value
					  		   ["lastName"] - value
					  		   ["age"] - value
					  		   ["income"] - value
						  
#recordList Output: 123456abcdef
```