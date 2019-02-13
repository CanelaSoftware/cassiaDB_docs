# function cdb_createBlob(pPath, pTarget, *pProject*, *pFromSync*)
---
## Summary
This function adds a [blob](https://en.wikipedia.org/wiki/Binary_large_object) to the database. It will create a copy of the blob either locally or on the cloud.

## Inputs
* **pPath** *(String)* - The location of the blob on disk. This can either be a relative path (based on the default folder), or an absolute path.
* **pTarget** *(String)* - The place to create the blob, either "cloud" or "local".
* \***pProject** *(String)* - The project name to save the blob to. Defaults to the current project. We recommend that you do not set this parameter.
* \***pFromSync** *(Bool)* - This optional key is used internally by the [**cbd_sync**](Sync.md) function. If it is true, the database will **NOT** create a record in the cdbBlobs table. Defaults to **false**. We recommend that you do not set this parameter.

> _*optional parameter._

## Outputs
*(String)* - The blobID of the new blob. This blobID is also the CDBRecordID of the blob in the _cdbBlobs_ table.

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