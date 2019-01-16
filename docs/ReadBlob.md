# function cdb_readBlob(pDataA, pTarget, *pProject*)

---
## Summary
This function reads one or more [blob](https://en.wikipedia.org/wiki/Binary_large_object) records from either cloud or local, and returns them as an array.

## Inputs
* **pDataA** *(Array)* - An array whose keys are blobIDs and values are empty.
* **pTarget** *(String)* - The place to read the blob, either "cloud" or "local".
* \***pProject** *(String)* - The project name associated with the blob.

> _*optional parameter._

![ReadBlobInput](images/ReadBlobInput.svg)

## Outputs
*(Array)* - One or more blobIDs with paths of the specified blobs.

![ReadBlobOutput](images/ReadBlobOutput.svg)

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

put cdb_readBlob(tDataA,tTarget,tProject) into tOutputA

# Output Array:
# tOutputA["01234567-abcd-8901-efgh-2345678901ij"] - value
```
