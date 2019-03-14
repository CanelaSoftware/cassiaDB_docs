# function cdb_createTable(pProject, pTable, pKeys, *pKeysType*, *pSchemaless*, *pTableDomain*, *pInstanceName*)
---
## Summary
This function creates a new table with keys and adds the table to a specified project.

## Inputs
* **pProject** *(String)* - The name of the project the table will be created in.

* **pTable** *(String)* - The name of the table to be created.

* **pKeys** *(String)* - The comma-delimited list of names of the keys that will be added to the table.

* \***pKeysType** *(Bool)* - An array whose keys are the type and values are the table's keys with that type. The only type currently accepted is "hyperblob".

* \***pSchemaless** *(Bool)* - Determines whether the table is schemaless or not. Default is false.

* \***pTableDomain** *(String)* - Specifies which table domain the table will be created in. Default is automatically chosen.

* \***pInstanceName** *(String)* - Specifies which instance the table will be created in. Default is automatically chosen.

> _*optional parameter._

## Outputs
*(String)* - The table ID of the newly created table.

## Additional Requirements
This API call requires internet access in order to create a table in cloud records.

## Examples
```livecodeserver
local tProject, tTable, tKeys

# Project name: meeting

put "meeting" into tProject
put "clients" into tTable
put "firstName,lastName,age,income" into tKeys

cdb_createTable(tProject,tTable,tKeys)

#Output: 72a88e4f-c6ba-4fda-9381-2f0b0ca220bd
```