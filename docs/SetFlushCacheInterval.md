# command cdb_setFlushCacheInterval pInterval
---

## Summary
This command will set the retry interval for the cdbCache. (See [CDBCache](CDBCache.md) for more information). Whenever the cdbCache is not empty, a *cdb_flushCache* message will be resent in **flushCacheInterval** milliseconds.

## Inputs
* **pInterval** *(number)* - The interval to flush the cdbCache in milliseconds. 
	* "0" will turn off autoflushing of the cache. [*cdb_flushCache*](FlushCache.md) will need to be manually called.


## Examples
```
cdb_setFlushCacheInterval 3000

# cdb_flushCache will be called every 3000 milliseconds, as needed.
``` 