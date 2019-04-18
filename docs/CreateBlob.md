# function cdb_createBlob(pPath, pTarget, *pProject*)
---
## Summary
This function adds a [blob](https://en.wikipedia.org/wiki/Binary_large_object) to the database. It will create a copy of the blob either locally or on the cloud.

## Inputs
* **pPath** *(String)* - The location of the blob on disk. This can either be a relative path (based on the default folder), or an absolute path.
* **pTarget** *(String)* - The place to create the blob, either "cloud" or "local".
* \***pProject** *(String)* - The project name to save the blob to. Defaults to the current project. We recommend that you do not set this parameter.

> _*optional parameter._

## Outputs
*(String)* - The ID of the new blob. This ID is the CDBRecordID of the blob in the _cdbBlobs_ table, which you can query/read/lookup.

## Additional Requirements
This API call requires internet access in order to create cloud records.

## Examples 
```livecodeserver
# Project Name: meetings

local tPath, tTarget, tFromSync, tProject, tBlobID

put "/Users/johnsmith/Desktop/blob.png" into tPath
put "cloud" into tTarget

put cdb_createBlob(tPath,tTarget) into tBlobID

# tBlobID now contains the blobID of the created blob: 01234567-abcd-8901-efgh-2345678901ij
```