# command cdb_clearTempBlobs pProjectID

---
Updated 11/22/19
## Summary
This command deletes the temporary blob folder of a specified project that is created when a blob is read. See [cdb_readBlob](ReadBlob.md) or [cdb_batchReadBlob](BatchReadBlob.md) for examples of the temporary blob folder file path.

## Inputs
* **pProjectID** *(String)* - The projectID whose temporary blob folder you would like to delete.

## Examples
```livecodeserver
# Project Name: meetings
# ProjectID: 8fc03fe9-cd65-5358-hjk6-df85eb363984

local tProjectID

put "8fc03fe9-cd65-5358-hjk6-df85eb363984" into tProjectID

cdb_clearTempBlobs tProjectID

# Folder "~temp" with file path "/home/username/project/CanelaDB/blobs/ProjectID/~temp" has been deleted.
```
