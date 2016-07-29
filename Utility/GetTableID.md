# cdb_getTableID
---
```
function cdb_getTableID(tTableName)
```

## Summary:
This function takes a table name and returns the ID of that table.

## Inputs:
* **`tTableName`** *(String)* - The name of the table.

## Outputs:
(String) - The Table ID of the specified table.

## API Version:
* `0.3.1` - Introduced

## Examples:
```  
put cdb_getTableID("customers") into tTableID
``` 