# function cdb_tableID(pTableName)
---

## Summary
This function returns the tableID of the specified table or an array mapping name to its ID for all tables in the project.

## Inputs
* **pTableName** *(String)* - The name of the table or "*".

## Outputs
* *(String)* - The tableID of the specified table. If the table does not exist, **empty** will be returned.

* *(Array)* - If "*" is passed in pTableName, an array whose keys are table name and their values are the corresponding tableID will be returned. This will map the name to ID for all tables in the project.

## Examples
```livecodeserver
# Table "clients" which has tableID "72a88e4f-c6ba-4fda-9381-2f0b0ca220bd"

get cdb_tableID("clients")

# Output: 72a88e4f-c6ba-4fda-9381-2f0b0ca220bd
``` 

```livecodeserver
# Project: meetings
# Tables in the project:
# Table "clients" which has tableID "72a88e4f-c6ba-4fda-9381-2f0b0ca220bd"
# Table "office" which has tableID "98765432-dcdc-0210-aaaa-975102a357ca"

local tOutputA

put cdb_tableID("*") into tOutputA

# tOutputA: ["clients"] - "72a88e4f-c6ba-4fda-9381-2f0b0ca220bd"
#			["office"] - "98765432-dcdc-0210-aaaa-975102a357ca"
``` 
