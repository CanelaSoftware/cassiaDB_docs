To allow users to create accounts in your application or interact with your cloud application without an account, you must use user authentication.

## Creating User Accounts
### Multiple User Accounts
This method is for applications that require users to create an account.

1. Create a user interface to allow users to create accounts. It must include fields for the following inputs unless indicated otherwise:
	* email
	* password
	* first name (optional)
	* last name (optional)
2. When users proceed to create an account, call [cdb_createUserAccount](https://docs.livecloud.io/CreateUserAccount/) with the necessary parameters. If a user account with the provided email does not exist in the cdbUsers table for the specified project, it will create a new record in the that table.

		# Required Parameters: 	pProjectName, pEmail, pPassword
		# Optional Parameters: 	pFirstName, pLastName

		cdb_createUserAccount pProjectName,pEmail,pPassword,pFirstName,pLastName


### Universal Account
This method is for cloud-based applications that do not require users to create accounts.

1. Create a user account for your project with an email and password of your choosing. **Do not use your developer credentials or any personal information.** You will be hardcoding the email and password in your application.

		# Required Parameters: 	pProjectName, pEmail, pPassword
		# Optional Parameters: 	pFirstName, pLastName

		cdb_createUserAccount pProjectName,pEmail,pPassword

## User Authentication
### Multiple User Accounts
This method is for applications that require users to log in.

1. Create a user interface to allow users to enter their email and password to log in.

2. When users proceed to log in, call [cdb_auth](https://docs.livecloud.io/Auth/) with the necessary parameters. Use [cdb_result](https://docs.livecloud.io/Result/) to check if the call was successful.

		get cdb_auth(pEmail,pPassword,"user")
	
		if not cdb_result() then
			answer "Failed to authenticate user."
		end if

### Universal Account
This method is for cloud-based applications that do not require users to log in.

1. Call [cdb_auth](https://docs.livecloud.io/Auth/) with the necessary parameters after the call to "initializeCassiaDB" in the "preOpenStack" of the application's stack script. Hardcode the email and password of the user account created in the "Creating User Accounts" section above in your stack script. This will authenticate the user with the hardcoded credentials when the application is opened.

		on preOpenStack
     		initializeCassiaDB
     		get cdb_auth(pEmail,pPassword,"user")
		end preOpenStack