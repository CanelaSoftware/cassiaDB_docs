cdb_SaveRecord
===
`function cdb_SaveRecord pRecordA, pClientDatabaseName`

**Summary:**  
This function creates a record both in the cloud and locally with the provided data, or updates an existing record with the provided data if the record exists.

**Inputs:**  
`pRecordA` *(Array)* – An array containing a number of keys pertaining to a specific record. May or may not contain a cdbRecordID.  
`pClientDatabaseName`\* *(String)* – The label of the database to access, or the working database if empty.

**Outputs:**  
*(String)* – Contains the allocated cdbRecordID for the new record, or the provided cdbRecordID for updates. Note: Empty output indicates function failed to complete successfully.

**Additional Requirements:**  
This API call requires internet access.

**API Version:**  
Introduced – 1.0  
Modified – 1.4

**Examples:**
---
```
put "550e8400-e29b-41d4-a716-446655440000" into tCustomerA["cdbRecordID"]
put "Gary" into tCustomerA["firstName"]
put cdb_SaveRecord(tCustomerA,"Customers") into tNewUUID
```


\* optional parameter