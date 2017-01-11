# function cdb_ping()
---
## Summary:
Pings the cloud server and returns the response time in milliseconds.

## Inputs:
None

## Outputs:
(String) - the response time of the CDB server in milliseconds

## Additional Requirements:
This API call requires internet access.

## API Version:
* `0.3.0` - Introduced

## Examples:
```
put cdb_ping()

#Output: 59.479904
```