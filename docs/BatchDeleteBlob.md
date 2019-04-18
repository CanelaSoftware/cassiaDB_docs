# command cdb_batchDeleteBlob pDataA, pTarget, *pProject*

---
## Summary
This command deletes one or more [blob](https://en.wikipedia.org/wiki/Binary_large_object) records from either cloud or local, and returns the blobIDs of the deleted blobs as an array.

## Inputs
* **pDataA** *(Array)* - An array where each key is a record ID to be deleted, with a value of empty.
	* [RecordID 1] - Key is the recordID for the first blob to be deleted.
    		* _empty_ - The value of all keys must be empty.
    	* [RecordID n] - Key is the recordID for the nth blob to be deleted.
    		* _empty_ - The value of all keys must be empty.
* **pTarget** *(String)* - The place to delete the blob, either "cloud" or "local".
* \***pProject** *(String)* - The project name to delete the blob from. Defaults to the current project. We recommend that you do not set this parameter.

> _*optional parameter._

![Batch Delete Blob Input Diagram](/images/BatchBlobInput.svg)

## Additional Requirements
This API call requires internet access.

## Examples
```livecodeserver
# Project Name: meetings
# blobIDs: 01234567-abcd-8901-efgh-2345678901ij, 87654321-abcd-1234-cdef-1234567890ab

put empty into tInputA["01234567-abcd-8901-efgh-2345678901ij"]
put empty into tInputA["87654321-abcd-1234-cdef-1234567890ab"]

cdb_batchDeleteBlob tInputA,"cloud"

#The Blob objects no longer exists in the cloud, and the blob record no longer exists in the cdbBlobs table.
```
