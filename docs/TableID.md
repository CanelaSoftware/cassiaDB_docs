# function cdb_tableID(pTableName)
---
Updated 11/22/19
## Summary
This function returns the tableID of the specified table (one table is passed) or an array mapping table name to its tableID (more than one table is passed).

## Inputs
* **pTableName** *(String)* - The name of the table, a comma-delimited list of table names, or "*" for all tables in the project.

## Outputs
* *(String)* - The tableID of the single, specified table. If the table does not exist, **empty** will be returned.

* *(Array)* - If more than one table name or "*" is passed in pTableName, an array is returned with the keys being table name and each key is mapped to its corresponding tableID.

## Examples
```livecodeserver
# Table "clients" which has tableID "72a88e4f-c6ba-4fda-9381-2f0b0ca220bd"

get cdb_tableID("clients")

# Output: 72a88e4f-c6ba-4fda-9381-2f0b0ca220bd
``` 

```livecodeserver
# Table "clients" which has tableID "72a88e4f-c6ba-4fda-9381-2f0b0ca220bd"
# Table "office" which has tableID "98765432-dcdc-0210-aaaa-975102a357ca"

local tTableName, tOutputA

put "clients,office" into tTableName
put cdb_tableID(tTableName) into tOutputA

# tOutputA: ["clients"] - "72a88e4f-c6ba-4fda-9381-2f0b0ca220bd"
#			["office"] - "98765432-dcdc-0210-aaaa-975102a357ca"
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