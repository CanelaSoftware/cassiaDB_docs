# function cdb_updateBlob(pPath, pBlobID, pTarget, *pProject*)

---
## Summary
This function updates a specified [blob](https://en.wikipedia.org/wiki/Binary_large_object) record from either cloud or local, and returns the blobID of the updated blob as an array.

## Inputs
* **pPath** *(String)* - The location of the new blob on disk. This can either be a relative path (based on the default folder), or an absolute path.
* **pBlobID** *(String)* - The blobID of the specified blob.
* **pTarget** *(String)* - The place to update the blob, either "cloud" or "local".
* \***pProject** *(String)* - The project name associated with the blob.

> _*optional parameter._

## Outputs
*(Array)* - A "results" key containing the updated blob's blobID whose "blobData" key is empty.

![UpdateBlobOutput](images/UpdateBlobOutput.svg)

## Additional Requirements
This API call requires internet access.


## Examples
```livecodeserver
# Project Name: meetings
# blobID: 01234567-abcd-8901-efgh-2345678901ij

local tPath, tBlobID, tTarget, tProject, tOutputA

put "/Users/johnsmith/Desktop/updatedBlob.png" into tPath
put "01234567-abcd-8901-efgh-2345678901ij" into tBlobID
put "cloud" into tTarget
put "meetings" into tProject

put cdb_updateBlob(tPath,tBlobID,tTarget,tProject) into tOutputA

# Output Array:
# tOutputA["results"]["01234567-abcd-8901-efgh-2345678901ij"]["blobData"] - empty
```
