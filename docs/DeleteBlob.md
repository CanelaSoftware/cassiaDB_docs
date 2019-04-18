# command cdb_deleteBlob pRecordID, pTarget, *pProject*

---
## Summary
This command deletes one or more [blob](https://en.wikipedia.org/wiki/Binary_large_object) records from either cloud or local, and returns the blobIDs of the deleted blobs as an array.

## Inputs
* **pRecordID** *(String)* - The ID of the blob to be deleted. (i.e. the recordID of the blob in the _cdbBlobs_ table.)
* **pTarget** *(String)* - The place to delete the blob, either "cloud" or "local".
* \***pProject** *(String)* - The project name to delete the blob from. Defaults to the current project. We recommend that you do not set this parameter.

> _*optional parameter._

## Additional Requirements
This API call requires internet access.


## Examples
```livecodeserver
# Project Name: meetings
# blobID: 01234567-abcd-8901-efgh-2345678901ij

cdb_deleteBlob "01234567-abcd-8901-efgh-2345678901ij","cloud"

#The Blob object no longer exists in the cloud, and the blob record no longer exists in the cdbBlobs table.
```
