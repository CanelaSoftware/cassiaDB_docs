# cdb_getTeamID
---
```
function cdb_getTeamID(tTableID)
```

## Summary:
This function returns the team ID when given a table ID.

## Inputs:
 * `tTableID` *(String)* - The table ID to get the team ID from.

## Outputs:
 * *(String)* the team ID of the table ID given as input.

## API Version:
* `0.3.1` - Introduced

## Examples:
```
local tTableID, tTeamID

put cdb_getTableID("clients") into tTableID
put cdb_getTeamID(tTableID) into tTeamID
``` 