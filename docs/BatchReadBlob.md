# function cdb_batchReadBlob(pDataA, pTarget, *pProject*)

---
## Summary
This function reads one [blob](https://en.wikipedia.org/wiki/Binary_large_object) record from either cloud or local, and returns the path where the blob can be accessed.

## Inputs
* **pDataA** *(Array)* - An array where each key is a record ID to be read, with a value of empty.
	* [RecordID 1] - Key that is the recordID for the first blob to be read.
    		* _empty_ - The value of the corresponding key must be empty.
* **pTarget** *(String)* - The place to delete the blob, either "cloud" or "local".
* \***pProject** *(String)* - The project name to delete the blob from. Defaults to the current project. We recommend that you do not set this parameter.

> _*optional parameter._

![Batch Read Blob Input Diagram](/images/BatchBlobInput.svg)

## Outputs
*(Array)* - An array where each key is a recordID and each value is the corresponding filepath to the blob file.

![Batch Read Blob Output Diagram](/images/ReadBlobOutput.svg)

## Additional Requirements
This API call requires internet access to make cloud reads.

## Examples
```livecodeserver
# Project Name: meetings
# blobIDs: 01234567-abcd-8901-efgh-2345678901ij, 87654321-abcd-1234-cdef-1234567890ab
local tOutputA

put empty into tInputA["01234567-abcd-8901-efgh-2345678901ij"]
put empty into tInputA["87654321-abcd-1234-cdef-1234567890ab"]

put cdb_batchReadBlob(tInputA,"cloud") into tOutputA

set the filename of image "myImage" to tOutputA["01234567-abcd-8901-efgh-2345678901ij"]

# tOutputA now contains the following:
#          ["01234567-abcd-8901-efgh-2345678901ij"]: "/home/username/project/CanelaDB/blobs/ProjectID/~temp/01234567-abcd-8901-efgh-2345678901ij.png"
#          ["87654321-abcd-1234-cdef-1234567890ab"]: "/home/username/project/CanelaDB/blobs/ProjectID/~temp/87654321-abcd-1234-cdef-1234567890ab.png"
```
