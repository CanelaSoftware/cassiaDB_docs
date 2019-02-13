# function cdb_batchCreateBlob(pDataA, pTarget, *pProject*, *pFromSync*)
---
## Summary
This function adds multiple [blobs](https://en.wikipedia.org/wiki/Binary_large_object) to the database. It will create a copy of each blob either locally or on the cloud.

## Inputs
* **pDataA** *(Array)* - A multidimensional array, where each key is an arbitrary, user-defined name for the blob. There must be at least one key in the array.
	* [indexKey 1] *(Array)* - An arbritrary user-defined name for a blob. Recommended names are 1, 2, ..., N. This key maps to a sub-array with the following structure:
    		* [**blobType**] *(String)* - the type of the file to be uploaded. This allows for easier lookup of the Blob Type (i.e. you can find the type without having to download the file.)
    		* [**blobData**] *(Binary Data)* - the data to be uploaded. This data is treated as binary data. You can put data into this key using ```url("binfile:YOUR_FILE_PATH_GOES_HERE")```
    		
    	* \*[indexKey N] *(Array)* - The nth blob. Repeat *indexKey 1*'s sublevel structure.
* **pTarget** *(String)* - The place to create the blob, either "cloud" or "local".
* \***pProject** *(String)* - The project name to save the blob to. Defaults to the current project. We recommend that you do not set this parameter.
* \***pFromSync** *(Bool)* - This optional key is used internally by the [**cbd_sync**](Sync.md) function. If it is true, the database will **NOT** create a record in the cdbBlobs table. Defaults to **false**. We recommend that you do not set this parameter.

> _*optional parameter._

## Outputs
*(Array)* - An array with the same keys as the **pDataA** input array. Each key will contain the blobID of the corresponding blob. Any keys that are missing were not successfully saved as blobs.

![Batch Create Blob Output Diagram](/images/BatchCreateBlobOutput.svg)

## Additional Requirements
This API call requires internet access in order to create cloud records.

## Examples 
```livecodeserver
# Project Name: meetings

local tDataA, tTarget, tFromSync, tProject, tBlobsA

put url("binfile:/Users/johnsmith/Desktop/blob.png") into tDataA[1]["blobData"]
put ".png" into tDataA[1]["blobType"]

put url("https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4") into tDataA[2]["blobData"]
put ".mp4" into tDataA[2]["blobType"]

put "cloud" into tTarget

put cdb_batchCreateBlob(tDataA,tTarget) into tBlobsA

# tBlobsA contains:
#	[1] - 01234567-abcd-8901-efgh-2345678901ij
#	[2] - 99999999-efgh-1231-aaaa-234567890142

```