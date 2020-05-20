# function cdb_calcBatchUpdate pDataA, pTarget, *pInternalA*
---
Created 2020/04/09

## Summary
This function allows addition, subtraction, multiplication, division operations on any key that contains numeric data. The updated data is returned to the client. Since the server is processing the calculation, this prevents collisions on the same data. No prior knowledge of the server's value of a given column is needed to make the update.

You can access any amount of records on any amount of tables in a single transaction .

This API can work with both local and cloud data. It is most effective when used on cloud data because your goal is update a numeric value without having to worry about data collisions with other modifications to the same data. 

## Inputs
* **pDataA** *(Array)* - A multidimensional array of keys, where each key is a tableID that maps to another array of keys. There must be at least one tableID key in this array.
    * [tableID 1] *(Key)* - Key is the first table's ID, maps to subarray of record IDs. There must be at least one record key in this sub-array.
    	* [cdbRecordID 1] *(Key)* - Key that is the cdbRecordID of the first record to be updated. 
    		* [keyName 1] *(Key)* - User-defined keyname corresponding to a value of the record to be udpated. The value of this key must be numeric.
    			* [operation 1] *(Key)* - add, subtract, multiply, divide
    				*  value - The numeric value that will be used in the calculation.
    		* \*[keyName N] *(Key)* - The nth user-defined keyname. Repeat *keyName 1*'s sublevel structure.
    			* \*[operation N] *(Key)* - The nth operation: add, subtract, multiply, divide.
					*  value - The numeric value that will be used in the calculation.
    	* \*[cdbRecordID N] *(Key)* - The nth record key. Repeat *cdbRecordID 1*'s sublevel structure.
    * \*[tableID N] *(Key)* - key that is the nth table's UID. Repeat *tableID 1*'s sublevel structure.

* **pTarget** *(String)* - The place to udpate the record, either "cloud" or "local".

* \***pInternalA** *(Array)* - An array whose key is "delaySend" and its value is true. Optional parameter if pTarget is "cloud." This will delay processing the cloud call and will store its transaction in "cdbCache." Use [cdb_flushCache](FlushCache.md) to process the delayed transactions.

> _*optional parameter._

## Additional Requirements
This API call requires internet access to update cloud records.

## Examples
```livecodeserver
## Expectations: Our company "We Have It All" will process two orders from two different customers.
# Each customer is ordering the same product from our sales person.
# Our software is designed to batch process orders every 30 minutes. 
# Customer "Wine Surplus R Us" is ordering 159 bottles of wine.
# Customer "ACME Supplies" is ordering 3 bottles of wine.
# We need to update two records from our "orders" table and a single record on our "inventory" table.


# Table name: orders					
# Keys: customerLinkingID,totalOrders

# Records as they are before we process the order from "Wine Surplus R Us"
# [f23a3c8d-6326-466e-bca1-ee077f3c34e6]["totalOrders"] - "414"
# [f23a3c8d-6326-466e-bca1-ee077f3c34e6]["customerLinkingID"] - "22f46f66-63aa-4408-9743-540303124016"

# Records as they are before we process the order from "ACME Supplies"  
# [7f367fe6-cc8f-47af-8bbe-1de82641e89f]["totalOrders"] - "53"
# [7f367fe6-cc8f-47af-8bbe-1de82641e89f]["customerLinkingID"] - "2c6cb9de-3180-4f00-a12c-3cfee0c5406e"

# Table name: inventory
# Keys: productID,remainingProductQuantity,productName,productDescription

# Records as they are before we process the order:
# [ee9556ac-acf5-440c-bf7e-00cf13fe7025]["productID"] - "J89D-QP"
# [ee9556ac-acf5-440c-bf7e-00cf13fe7025]["remainingProductQuantity"] - "2815"
# [ee9556ac-acf5-440c-bf7e-00cf13fe7025]["productName"] - "Smoking Cat Cabernet Sauvignon"
# [ee9556ac-acf5-440c-bf7e-00cf13fe7025]["productDescription"] - "Creamy aromas of milk chocolate and berry fruits set up a moderately gripping palate. Nonspecific berry and clove flavors finish plump and chewy, with a strong oak character on the close."

                                     

local tCalcValue, tInputA, tOperation, tOutputA, tWineSurplusRecordID

put cdb_tableID("orders") into tOrdersTableID                            
put cdb_tableID("inventory") into tInventoryTableID
put "f23a3c8d-6326-466e-bca1-ee077f3c34e6" into tWineSurplusRecordID
put "7f367fe6-cc8f-47af-8bbe-1de82641e89f" into tACMEsuppliesRecordID
put "ee9556ac-acf5-440c-bf7e-00cf13fe7025" into tProductRecordID

put "cloud" into tTarget

## Update "totalOrders" for each company's order record so we know how many of this product they have ordered this year
put "159" into tInputA[tInventoryTableID][tWineSurplusRecordID]["remainingProductQuantity"]["add"]
put "3" into tInputA[tInventoryTableID][tACMEsuppliesRecordID]["remainingProductQuantity"]["add"]

## Update "remainingProductQuantity" in the inventory table so we know how many "Smoking Cat Cabernet Sauvignon" we have left
put "159" into tInputA[tInventoryTableID][tProductRecordID]["remainingProductQuantity"]["subtract"]
put "3" into tInputA[tInventoryTableID][tProductRecordID]["remainingProductQuantity"]["subtract"]

put cdb_calcBatchUpdate(tInputA,tTarget) into tOutputA

## tOutputA returns the result of the calculations
# tOutputA[tOrdersTableID][tWineSurplusRecordID] - "573"
#         [tOrdersTableID][tACMEsuppliesRecordID] - "56"
#         [tInventoryTableID][tProductRecordID] - "2653"


## The updated keys on the tables now look like this:
# Table name: orders						
# [f23a3c8d-6326-466e-bca1-ee077f3c34e6]["totalOrders"] - "573"
# [7f367fe6-cc8f-47af-8bbe-1de82641e89f]["totalOrders"] - "56"

# Table name: inventory
# [ee9556ac-acf5-440c-bf7e-00cf13fe7025]["remainingProductQuantity"] - "2653"
```
