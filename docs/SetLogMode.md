# command cdb_setLogMode pMode
---

## Summary
This command will set the logging mode of the CDB libraries.

## Inputs
* **pMode** *(String)* - The log mode. Must be one of the following:
	* **"message box"** - Will log to the message box.
	* **"disk"** - Will log to file "Results.txt", located inside folder "CassiaDB Logs" next to the mainstack.
	* **"ignore"** - Will not log.

## Examples
```
cdb_setLogMode "ignore"
# errors and other CDB messages will not be logged.
```
```
cdb_setLogMode "message box"

put cdb_read("clients","*") into tRecordsA
# Message box will log the following error:
# "You must provide either 'local' or 'cloud' in the parameter pTarget."

``` 