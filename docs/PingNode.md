# function cdb_pingNode(*pTable*)
---
## Summary
Pings the cloud server where the table is located and returns the response time in milliseconds. This function is NOT processed by the CDB cloud server, so it only checks if the server is reachable from the client, not if the CDB cloud server is actually running. PingNode uses shell command "ping". As such, the response will be shorter than the cdb_ping() response.

## Inputs
* \* **pTable** *(String)* - The table name or table ID whose server will be pinged. If a table is not specified, then a table will be chosen by the library.

> \* _Optional Parameter_

## Outputs
(String) - the response time of the server in milliseconds

## Additional Requirements
This API call requires internet access.


## Examples
```
put cdb_pingNode()

// Output: 30.241524

put cdb_pingNode("clients")

// Output: 29.124442
```