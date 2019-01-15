# function cdb_tableNames()
---
## Summary
This function returns all table names in the application. This list is generated from the configuration of CassiaDB in the application.
	
## Outputs
*(String)* – An alphabetical, line-delimited list of all table names.

## Examples
```livecodeserver
put cdb_getTableNames()

#Output: clients
#	    employees
#	    office
```
