# function cdb_Query(pInputA)
---
## Summary
This function searches the specified table over the cloud, and returns the subset that matches that query in several possible formats. See [comparison operators](./QueryOperators.md) to find all operators allowed in a query.

## Inputs
* **pInputA**  *(Array)* - An array of keys containing the query, the table name, and an optional output format.
	* ["query"] *(Key)* - An array formatted as follows:
    	* ["key"] *(String)* - One of the following:
    		- *yourKey* - Searches the specified key
    		- "$" - Searches all schema-defined keys
    		- "*" - Searches all schema-defined keys and internal keys.
    	* ["value"] *(String)* - The value to compare with.
    	* ["operator"] *(String)* - The [comparison operator](./QueryOperators.md) to compare each record's value at the key specified to the value specified.
    - ["cdbTableName"] *(String)* - The table name or table ID to search through.
    - ["cdbTarget"] *(String)* - The place to query, either "cloud" or "local".
    - *["resultFormat"] *(String)*: 
    	-  "recordList" *(default)* - returns a line-delimited list of the recordIDs that match the query.
    	- "recordData" - returns an array of full records that match the query.

> _*optional parameter._

![Query input diagram](images/QueryInput.svg)


## Outputs
* *(String)* - If *pInputA["resultFormat"]* is "recordList" or if no such key is provided:
	* Output is  a line-delimited list of the recordIDs that match the query.
* *(Array)* - If *pInputA["resultFormat"]* is "recordData":
	* Output is an array where each key is a recordID that matches the query, with subkeys defined by the schema.
![Record Data Output](images/BasicOutput.svg)

## Additional Requirements
This API call requires internet access.

## API Version
* 0.3.0 - Introduced

## Examples
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
put "cloud" into tInputA["cdbTarget"]

#recordData output format
put "recordData" into tInputA["resultFormat"]
#OR
#recordList output format
put "recordList" into tInputA["resultFormat"]

put cdb_Query(tInputA) into tOutputA

#recordData Output: tOutputA[123456abcdef]["cdb"] - metadata
					  	       ["firstName"] - value
					  		   ["lastName"] - value
					  		   ["age"] - value
					  		   ["income"] - value
						  
#recordList Output: 123456abcdef
```