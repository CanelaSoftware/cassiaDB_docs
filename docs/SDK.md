# function cdb_SDK(pProject, pMode)
---

## Summary
This function loads the config(s) for the specified project(s).

## Inputs
* **pProject** *(String)* - Comma-delimited list of projects to load. Can also be **"\*"** to indicate loading all projects.

* \***pMode** *(String)* - Specifies whether a message is outputted to the message box in the IDE. If "silent", nothing is output to the message box.

> _*optional parameter._

## Outputs
(String) - A message to the message box, while in the IDE, if pMode is not "silent".

## Examples
```livecodeserver
# Project "meeting"

get cdb_SDK("meeting")

# Outputs 
# "Your SDK has been downloaded."
``` 