# command cdb_updateBlob pPath, pBlobID, pTarget, *pProject*

---
## Summary
This command updates a specified [blob](https://en.wikipedia.org/wiki/Binary_large_object) record on either cloud or local, replacing the existing blob with a new one.

## Inputs
* **pPath** *(String)* - The location of the new blob on disk. This can either be a relative path (based on the default folder), or an absolute path.
* **pBlobID** *(String)* - The blobID of the specified blob.
* **pTarget** *(String)* - The place to update the blob, either "cloud" or "local".
* \***pProject** *(String)* -  The project name to update the blob to. Defaults to the current project. We recommend that you do not set this parameter.

> _*optional parameter._

## Additional Requirements
This API call requires internet access for cloud updates.


## Examples
```livecodeserver
# Project Name: meetings
# blobID: 01234567-abcd-8901-efgh-2345678901ij

local tPath, tBlobID, tTarget, tProject

put "/Users/johnsmith/Desktop/updatedBlob.png" into tPath
put "01234567-abcd-8901-efgh-2345678901ij" into tBlobID
put "cloud" into tTarget
put "meetings" into tProject

cdb_updateBlob tPath,tBlobID,tTarget,tProject

# blob 01234567-abcd-8901-efgh-2345678901ij now contains the updatedBlob.png in the cloud.
```
