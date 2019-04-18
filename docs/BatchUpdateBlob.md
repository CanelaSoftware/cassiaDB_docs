# command cdb_BatchUpdateBlob pDataA, pTarget, *pProject*

---
## Summary
This command updates a specified [blob](https://en.wikipedia.org/wiki/Binary_large_object) record on either cloud or local, replacing the existing blob with a new one.

## Inputs
* **pDataA** *(Array)* - An array where each key is a record ID to be updated, with a value of the filepath to the data.
	* [RecordID 1] - Key is the recordID for the first blob to be updated.
    		* filename (String) - The value should be the new filepath of the blobID.
* **pTarget** *(String)* - The place to update the blobs, either "cloud" or "local".
* \***pProject** *(String)* -  The project name to update the blobs to. Defaults to the current project. We recommend that you do not set this parameter.

> _*optional parameter._
![Batch Update Blob Input Diagram](/images/BatchUpdateBlobInput.svg)

## Additional Requirements
This API call requires internet access for cloud updates.


## Examples
```livecodeserver
# Project Name: meetings
# blobs: 01234567-abcd-8901-efgh-2345678901ij, 87654321-abcd-1234-cdef-1234567890ab

local tInputA

put "/Users/johnsmith/Desktop/updatedBlob.png" into tInputA["01234567-abcd-8901-efgh-2345678901ij"]
put "/Users/johnsmith/Desktop/updatedVideo.mp4" into tInputA["87654321-abcd-1234-cdef-1234567890ab"]

cdb_updateBlob tInputA,"cloud"

# blob 01234567-abcd-8901-efgh-2345678901ij now contains the updatedBlob.png in the cloud.
# blob 87654321-abcd-1234-cdef-1234567890ab now contains the updatedVideo.mp4 in the cloud.
```
