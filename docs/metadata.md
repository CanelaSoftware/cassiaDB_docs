# Metadata
---

Every record in CassiaDB has certain information stored about the record itself. This metadata can be used to see when a record was created, when it was last changed, how many updates have been made to the record, etc. Metadata in CassiaDB is stored in each record under the "CDB" key. The following sub-keys are used:

* **cdbDateCreated** - The unix time when the record was created

* **cdbDateModified** - The unix time when the record was last modified

* **cdbRecordID** - The record ID

* **cdbRecordVersion** - The version number of the record (ticks up every time the record is modified).

* **cdbCloudSyncVersion** - Used to keep the track of the local/cloud. Resets to 0 whenever Local and Cloud are in sync.

* **cdbTableID** - The table ID of the record

* **cdbTableName** - The table Name of the record


You can find this metadata after reading a record. You can also directly query this record