# command cdb_checkInternetStatus
---

## Summary
This command will check whether the client is connected to the internet, and set a global variable for the network status. It will attempt to connect to **_https://caneladb.com_**.

* If the domain can be successfully reached, the internet status will be set to **true**.
* If this domain is unreachable, the internet status will be set to **false**.

## Inputs
None

## Examples
```
# While Online

cdb_checkInternetStatus

# gCSInetworkstatusA["status"] will be set to true
# Network calls (i.e., cloud calls) will be attempted and will respond normally

# While Offline (Internet unplugged, no service on mobile, etc.)

cdb_checkInternetStatus

# gCSInetworkstatusA["status"] will be set to false
# Network calls (i.e., cloud calls) may not be attempted.
# Cloud writes will be cached until the internet is available again.

``` 