# command cdb_flushCache
---

## Summary
This command will attempt to flush the cdbCache to the cloud. (See [CDBCache](CDBCache.md) for more information). If the CDBCache is not empty but cannot be flushed (due to internet connectivity), then the *cdb_flushCache* message will be resent in **flushCacheInterval** milliseconds. The flushCacheInterval can be set using command [**cdb_setFlushCacheInterval**](SetFlushCacheInterval.md).

## Inputs
None.

## Additional Requirements
This API call requires internet access in order to be successful.

## Examples
### Example 1:
```livecodeserver
# While connected to the internet
cdb_flushCache

put cdb_result()
# Outputs true
``` 
### Example 2:
```livecodeserver
# While not connected to the internet
cdb_flushCache

put cdb_result("response")
# Outputs "Could not flush cache. Not connected to the internet."
# cdb_flushCache will be called again in flushCacheInterval milliseconds, until it is successful.
``` 