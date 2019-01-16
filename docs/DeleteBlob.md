# function cdb_deleteBlob(pDataA, pTarget, *pProject*)

---
## Summary
This function deletes one or more [blob](https://en.wikipedia.org/wiki/Binary_large_object) records from either cloud or local, and returns the blobIDs of the deleted blobs as an array.

## Inputs
* **pDataA** *(Array)* - An array whose keys are blobIDs and values are empty.
* **pTarget** *(String)* - The place to delete the blob, either "cloud" or "local".
* \***pProject** *(String)* - The project name associated with the blob.

> _*optional parameter._

![DeleteBlobInput](images/DeleteBlobInput.svg)

## Outputs
*(Array)* - A "results" key with one or more blobIDs with key "blobData" whose value is empty.

![DeleteBlobOutput](images/DeleteBlobOutput.svg)

## Additional Requirements
This API call requires internet access.


## Examples
```livecodeserver
# Project Name: meetings
# blobID: 01234567-abcd-8901-efgh-2345678901ij

local tDataA, tTarget, tProject, tOutputA

put empty into tData["01234567-abcd-8901-efgh-2345678901ij"]
put "cloud" into tTarget
put "meetings" into tProject

put cdb_deleteBlob(tDataA,tTarget,tProject) into tOutputA

# Output Array:
# tOutputA["results"]["01234567-abcd-8901-efgh-2345678901ij"]["blobData"] - empty
```
