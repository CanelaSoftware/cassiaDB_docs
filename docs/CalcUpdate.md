# function cdb_calcUpdate pDataA, pOperator, pTable, pRecordID, pTarget, *pInternalA*
---
Created 2020/04/09

## Summary
This function allows addition, subtraction, multiplication, division operations on any key that contains numeric data. The updated data is returned to the client. Since the server is processing the calculation, this prevents collisions on the same data. No prior knowledge of the server's value of a given column is needed to make the update.

You can access only one record at a time. But, you can access more than one key on a single transaction.

This API can work with both local and cloud data. It is most effective when used on cloud data because your goal is update a numeric value without having to worry about data collisions with other modifications to the same data.


## Inputs
* **pDataA** *(Array)* - An array with the following format:
    * [*keyName 1*] *(String)* - A key as defined by the table's schema ([see TableKeys](./TableKeys.md)). User must provide at least one key.
		* value - The numeric value to be used in the calculation with pOperator.
    * \*[*keyName N*] *(String)* - A key as defined by the table's schema.
    	* value - The new value for the corresponding key.
* **pOperation** *(String)* - The operation used for the calculation: add, subtract, multiply, or divide.
* **pTable** *(String)* - The name or tableID of the specified table.
* **pRecordID** *(String)* - The cdbRecordID of the record being updated.
* **pTarget** *(String)* - The place to update the record, either "cloud" or "local".
* \***pInternalA** *(Array)* - An array whose key is "delaySend" and its value is true. Optional parameter if pTarget is "cloud." This will delay processing the cloud call and will store its transaction in "cdbCache." Use [cdb_flushCache](FlushCache.md) to process the delayed transactions.

> \* _optional parameter_.

![UpdateInput](images/UpdateInput.svg)

## Additional Requirements
* This API call requires internet access in order to update cloud records.

## Examples
```livecodeserver
local tCalcValue, tInputA, tOperation, tOutputA, tRecordID

# Table name: inventory
# Table ID: 2dabc384-6c5d-467e-ba00-b14b03312760
# Keys: productName, sold, flavor, type, remaining
# cdbRecordID: 4c074c1b-e4e8-41a9-8dbf-810c42650c38
# The current value of the key 'remaining' is 1000

# One or more keys
put "5" into tInputA["remaining"]

put "subtract" into tOperation
put "inventory" into tTable
put "4c074c1b-e4e8-41a9-8dbf-810c42650c38" into tRecordID
put "cloud" into tTarget 
     
cdb_calcUpdate tInputA,tOperation,tTable,tRecordID,tTarget

# Output Array: 
# tOutputA["2dabc384-6c5d-467e-ba00-b14b03312760"]
#						  ["55964aa7-6abc-4262-aefb-0328ac53c8f9"] - "995"
#						  
```

```livecodeserver
local tCalcValue, tInputA, tOperation, tOutputA, tRecordID

# Table name: invoices
# Table ID: 63eb5104-9eec-45c6-9dde-1670fe80e539
# Keys: productName, total, customerName, customerAddress, itemCount, invoiceNumber
# cdbRecordID: be4285ed-54f8-4680-8f46-ac4cc0fa41b2
# The current value of the key 'invoiceNumber' is 6493

# One or more keys
put "1" into tInputA["invoiceNumber"]

put "add" into tOperation
put "invoices" into tTable
put "be4285ed-54f8-4680-8f46-ac4cc0fa41b2" into tRecordID
put "cloud" into tTarget
     
cdb_calcUpdate tInputA,tOperation,tTable,tRecordID,tTarget
# Output Array: 
# tOutputA["63eb5104-9eec-45c6-9dde-1670fe80e539"]
#						  ["be4285ed-54f8-4680-8f46-ac4cc0fa41b2"] - "6494"
#						  
```