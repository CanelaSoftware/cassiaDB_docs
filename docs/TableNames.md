# function cdb_tableNames()
---
## Summary
This function returns all table names in the application. This list is generated from the configuration of CanelaDB in the application.

## Inputs
None
	
## Outputs
*(String)* – An alphabetical, line-delimited list of all table names.

## Examples
```livecodeserver
get cdb_tableNames()

# Output: clients
#	      employees
#	      office
```
