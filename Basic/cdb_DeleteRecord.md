cdb_DeleteRecord
===
`command cdb_DeleteRecord pRecordIDList, pClientDatabaseName`

**Summary:**  
This command deletes a record from both the cloud database and the local database.

**Inputs:**  
`pRecordIDList` *(String)* – A single cdbRecordID, or a line-delimited list of cdbRecordIDs.  
`pClientDatabaseName`\* *(String)* – The label of the database to access, or the working database if empty.

**Additional Requirements:**  
This API call requires internet access.

**API Version:**  
Introduced – 1.0  
Modified – 1.1

**Examples:**
---
```
cdb_DeleteRecord "550e8400-e29b-41d4-a716-446655440000","Transactions"
```


\* optional parameter