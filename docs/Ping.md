# function cdb_ping(*pTable*)
---
## Summary
Pings the cloud server where the table is located and returns the response time. This function will be processed by the CDB Server, so a response indicates that the server is running and is processing requests.

## Inputs
* \* **pTable** *(String)* - The table name or table ID to ping. If a table is not specified, then a table will be chosen at random.

> \* _Optional Parameter_

## Outputs
(String) - the response time of the CDB server in milliseconds

## Additional Requirements
This API call requires internet access.


## Examples
```
put cdb_ping()

# Output: 59.479904

put cdb_ping("clients")

# Output: 58.145132
```