# command cdb_setCloudTolerance pTimeoutInterval, pCheckInternetInterval
---

## Summary
This command will set the intervals for cloud calls -- the Timeout interval (i.e. the length of time before an internet call fails), and the Check Internet interval (i.e. the interval with which CDB will attempt to go back online after it goes offline).

## Inputs
* **pTimeoutInterval** (number) - The interval before a timeout will occur during internet calls in milliseconds.
* **pCheckInternetInterval** (number) - The interval that CDB will attempt to go back online once it is offline (due to an internet call failing) in milliseconds.

## Examples
```
cdb_setCloudTolerance 5000,10000

# If an internet call takes longer than 5000 milliseconds, it will fail.
# After an internet call fails, CDB will try to reconnect to the internet every 10000 milliseconds.
``` 