# function cdb_readUsersByEmail(pEmail)
---
## Summary
This function returns an array of the records of each user, as specified by their email.

## Inputs
* **pEmail** *(String)* - A line-delimited list of emails corresponding to the users to read.

## Outputs
*(Array)* - The records of each user, with keys being the email of that user.

## Additional Requirements
This API call requires internet access.

## Examples
```livecodeserver
local tOutputA

put cdb_readUsersByEmail("user@email.com") into tOutputA

# Output: ["user@email.com"]["cdb"] - MetaData
#					   ["email"] - "user@email.com" 
#					   ["firstName"] - "MyFirstName"
#					   ["lastName"] - "MyLastName"
#					   ["password"] - hashedValueOfPassword
```