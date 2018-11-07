# function cdb_tableNames()
---
## Summary
This function returns all table names in the application. This list is generated from the configuration of CassiaDB in the application.
	
## Outputs
*(String)* – A alphabetical, line-delimited list of all table names.

## Examples
```
put cdb_getTableNames()

#Output: clients
#	    office
#	    employees
```
