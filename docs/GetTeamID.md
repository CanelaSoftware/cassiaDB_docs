# function cdb_getTeamID()
---
## Summary
This function returns the active team ID, which represents the Livecloud User.

## Outputs
 * (String) - The active team ID.

## API Version
* `0.3.0` - Introduced

## Examples
```
local tTeamID

put cdb_getTeamID() into tTeamID

# Output: 9fe03fc8-ef46-4835-bda6-bf58be273964
``` 