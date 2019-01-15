# function cdb_createBlob(pPath, pTarget, *pFromSync*, *pProject*)
---
## Summary
This function adds a [Blob](https://en.wikipedia.org/wiki/Binary_large_object) to the database. It will create a copy of the Blob either locally or on the cloud.

## Inputs
* **pPath** *(String)* - The location of the Blob on disk. This can either be a relative path (based on the default folder), or be an absolute path.

* **pTarget** *(String)* - The place to create the Blob, either "cloud" or "local".

* \***pFromSync** *(Bool)* - If this is specified, it will control whether or not the database creates a new hyperblob record in the CDBBlob table. Defaults to **false**.

* \***pProject** *(String)* - The project with which to associate the Blob. Only used when there are multiple projects in configuration.

## Outputs
*(String)* - The BlobID for the new record.

## Additional Requirements
This API call requires internet access in order to create cloud records.

## Examples 