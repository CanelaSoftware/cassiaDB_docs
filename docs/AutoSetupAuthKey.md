# function cdb_autoSetupAuthKey(*pAlternateLocationID*)

---
Created 2021-05-26
## Summary
This function will update the initializeCanelaDB handler with an updated authKey value. If you place your initializeCanelaDB handler into the stack script of the mainstack or in the card 1 script of the mainstack, CanelaDB will manage the update for you. *Do not use this location if your mainstack is to become a standalone.* You can not save updated code that has been converted into a standalone.

It is highly suggested to place the initializeCanelaDB handler in a file that is easy to update. Using a behavior in a script-only stack is considered best practice. You will need to call this API under this scenario because the cdb_autoSetupAuthKey() will not search your entire project. If you are using a location other than the two above, pass the long ID of the script that contains your initializeCanelaDB handler.  



## Inputs
* **pAlternateLocationID** *(String)* - The long ID of the card or stack script that contains your initializeCanelaDB handler.



## Outputs
* *(Bool)* - True if the authKey was successfully processed.
* *(String)* - If no *pAlternateLocationID* and the API can not locate your initializeCanelaDB handler automatically, the authKey is returned. You can use your own code to update your handler if you like. Or, pass a valid *pAlternateLocationID* and let the API manage everything for you.



## Examples
```livecodeserver
# We want to save our authKey in our initializeCanelaDB handler. This is a good API to use just after doing a cdb_sdk(). 

 //UPDATE initializeCanelaDB HANDLER
     put the long id of stack "setup.behavior" into tID
     get cdb_autoSetupAuthKey(tID)
     put it into tResponse
     if tResponse is not true then
          // AUTH KEY
          put tResponse into tAuthKey
          
          //STORE AUTHKEY IN initializeCanelaDB HANDLER
          put the script of stack "setup.behavior" into tScript
          put lineOffset("into gCDBAuthKey",tScript) into tLine
          if tLine > 0 and tAuthKey is not empty then
               put "put" && quote & tAuthKey & quote && "into gCDBAuthKey" into line tLine of tScript
               set the script of stack "setup.behavior" to tScript
          end if
          save stack "setup.behavior"
     end if


# Output: true --Found and successfully updated initializeCanelaDB handler
# Output: authKey - Could not find initializeCanelaDB handler
```
