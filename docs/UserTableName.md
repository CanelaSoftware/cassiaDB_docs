# function cdb_userTableName()
---
## Summary
This function returns the table name of the cdbUsers table. This function is needed in order to do normal Read/Update/Delete and Table operations on the cdbUsers table. Internally, the cdbUsers table is not named "cdbUsers". As such, this function is required in order to access the actual table records.

## Inputs
None

## Outputs
*(String)* - The actual table name of the cdbUsers table.

## Examples
```livecodeserver
put cdb_userTableName()

# Output: "cdbUsers-8fc03fe9-cd65-5358-hjk6-df85eb363984"
```