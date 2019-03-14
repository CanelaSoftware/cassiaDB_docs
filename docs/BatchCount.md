# function cdb_batchCount(pDataA, pTarget)
---
## Summary
This function counts the number of records (either cloud or local) in multiple tables.

## Inputs
* **pDataA** *(Array)* - Array with the following format:
     * [table ID 1] *(Key)* - Key is the first table's ID.
     * *[table ID N] *(Key)* - Key that is the nth table's ID.

* **pTarget** *(String)* - The place to count the records from, either "cloud" or "local".

> _*optional parameter._

![BatchCountInput](images/BatchCountInput.svg)

## Outputs
*(String)* – Contains the numeric count of records in a list of given tables.

## Additional Requirements
This API call requires internet access in order to count cloud records.

## Examples
```livecodeserver
local tCountA, tDataA, tClientsTableID, tOfficeTableID

#Table Name: clients 
#Table ID: "72a88e4f-c6ba-4fda-9381-2f0b0ca220bd"
#Table Name: office 
#Table ID: "98765432-dcdc-0210-aaaa-975102a357ca"
                                                
# There are 24 records in table clients and 12 records in table office on the cloud.

put cdb_tableID("clients") into tClientsTableID                                       
put cdb_tableID("office") into tOfficeTableID

put empty into tDataA[tClientsTableID]
put empty into tDataA[tOfficeTableID]

put cdb_batchCount(tDataA,"cloud") into tCountA

put tCountA[tClientsTableID]
# Output: 24

put tCountA[tOfficeTableID]
# Output: 12
```