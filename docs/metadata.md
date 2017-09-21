MetaData in CassiaDB is stored in each record under the "CDB" key. The following sub-keys are used:

cdbDateCreated - The unix time when the record was created
cdbDateModified - The unix time when the record was last modified
cdbRecordID - The record ID
cdbRecordVersion - The version number of the record (ticks up every time the record is modified).
cdbTableID - The table ID
cdbTableName - The table Name