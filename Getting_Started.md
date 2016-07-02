# Welcome to CassiaDB

CassiaDB is a database designed just for LiveCode developers. Canela uses this database for all of our app development. We have found it to be a big time saver for us. For this reason, we want to make it available for free to the LiveCode community.

CassiaDB is compatible with the same platforms LiveCode supports. Thus, you can develop on the following desktop operating systems: Macintosh, Windows and Linux. You can deploy standalones with CassiaDB on both desktops and mobile devices with complete feature parity.

These are the steps to setting up your CassiaDB SDK (cSDK). Working with the cSDK requires a commercial edition of LiveCode. LiveCode needs to be running at all times when interacting with the cSDK.



• Start your commercial edition of LiveCode
• Make a new stack and paste the following code into the card script of card 1 of your new stack. This code engages the cSDK at the start up of this stack.

			on preOpenStack
				 initializeLiveCloud
			end preOpenStack

			command initializeLiveCloud
				global gCDBauthKey
				local tLibraryPath

				wait 0 milliseconds with messages ## GIVE THE ENGINE A CHANCE TO SPIN UP
				put "TempAuth" into gCDBAuthKey ##TEMPORARY AUTHKEY
				set the itemDel to "/"
				put item 1 to -2 of (the fileName of this stack) into tLibraryPath
				put "/cassiaDB/libraries/CDB_Starter" after tLibraryPath
				if there is not a file tLibraryPath then
					answer "There is a problem accessing your CassiaDB libraries. Please refer to the Getting Started document."
				else
					start using stack tLibraryPath
					cdb_SetLogMode "message box" ##OPTIONAL
				end if
			end initializeLiveCloud


• Save and quit your stack
• Place the cassiaDB folder next to your stack
• Start your stack. Your SDK should now have access to a number of libraries for this stack. Open your message box and click on the 'Stacks in Use' icon to see the libraries.
• Our gCDBauthKey is temporary

Your cSDK is ready for configuration. We will start by creating our first table and keys.

• Open your message box and type the following to create your first table: cdb_createTable "customers"


required: local/server
localDirectory
mainStack


required: cloud 
instanceName
maxTransportSize
mode



required: local/cloud
authKey
clientData
coreValues
coreValuesSafe
keySizeLimit
