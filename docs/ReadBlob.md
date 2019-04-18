# function cdb_readBlob(pRecordID, pTarget, *pProject*)

---
## Summary
This function reads one [blob](https://en.wikipedia.org/wiki/Binary_large_object) record from either cloud or local, and returns the path where the blob can be accessed.

## Inputs
* **pRecordID** *(String)* - The ID of the blob to be read.
* **pTarget** *(String)* - The place to read the blob, either "cloud" or "local".
* \***pProject** *(String)* - The project name associated with the blob. Defaults to the current project. We recommend that you do not set this parameter.

> _*optional parameter._

## Outputs
*(String)* - The filepath to the blob file.

## Additional Requirements
This API call requires internet access.


## Examples
```livecodeserver
# Project Name: meetings
# blobID: 01234567-abcd-8901-efgh-2345678901ij
local tOutput

put cdb_readBlob("01234567-abcd-8901-efgh-2345678901ij","cloud","meetings") into tOutput

# tOutput: "/home/username/project/CanelaDB/blobs/ProjectID/~temp/01234567-abcd-8901-efgh-2345678901ij.png"
```
