# function cdb_createBlob(pPath, pTarget, pFromSync, *pProject*)
---
## Summary
This function adds a [blob](https://en.wikipedia.org/wiki/Binary_large_object) to the database. It will create a copy of the blob either locally or on the cloud.

## Inputs
* **pPath** *(String)* - The location of the blob on disk. This can either be a relative path (based on the default folder), or an absolute path.
* **pTarget** *(String)* - The place to create the blob, either "cloud" or "local".
* **pFromSync** *(Bool)* - This controls whether or not the database creates a new hyperblob record in the cdbBlobs table. Defaults to **true**.
* \***pProject** *(String)* - The project name to associate the blob with.

## Outputs
*(Array)* - Key "results" whose value contains the key "1" and the blobID of the new blob as its value.

![CreateBlobOutput](images/CreateBlobOutput.svg)

## Additional Requirements
This API call requires internet access in order to create cloud records.

## Examples 
```livecodeserver
# Project Name: meetings

local tPath, tTarget, tFromSync, tProject, tBlobID

put "/Users/johnsmith/Desktop/blob.png" into tPath
put "cloud" into tTarget
put false into tFromSync
put "meetings" into tProject

put createBlob(tPath,tTarget,tFromSync,tProject) into tBlobID

# tBlobID now contains the blobID of the created blob: 01234567-abcd-8901-efgh-2345678901ij
```