cdb_GetRecord
=============
`function cdb_GetRecord pRecordIDList, pClientDatabaseName`

**Summary:**  
This function downloads the most recent version of the record from the cloud, updates the local version of that record, and then returns that record as an array.

**Inputs:**  
`pRecordIDList` *(String)* – A single cdbRecordID, or a line-delimited list of cdbRecordIDs.  
`pClientDatabaseName`\* *(String)* – The label of the database to access, or the working database if empty.

**Outputs:**  
*(Array)* – If a single record was requested, a one-dimensional array of data as defined by the record’s schema. If multiple records were requested, a multidimensional array of the cdbRecordIDs requested, populated with the appropriate data.

**Additional Requirements:**  
This API call requires internet access.

**API Version:**  
Introduced – 1.0  
Modified – 1.4

\* *optional parameter*

**Examples:**
-------------
```
get cdb_GetRecord("550e8400-e29b-41d4-a716-446655440000")
```

```
put cdb_GetRecord(tCurrentUser,"Customers") into tCustomerDataA
```