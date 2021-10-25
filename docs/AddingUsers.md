# Accounts and Authorization

LiveCloud includes a User Auth package, with APIs integrated into the CanelaDB libraries. __Auth is a requirement in order to access the Cloud.__ All your application's users must create an account in order to access your project's cloud data. Fortunately, the setup and coding required for this is straightforward and easy to do.

# LiveCloud Accounts

When you first signed up and created an account in order to start using LiveCloud, you created a __Developer Account__. Developer accounts can be used to log in to the LiveCloud Manager App (LCM) in order to see and modify your data. Beyond regular data management, you can also manage your projects and your tables in LCM. Specifically, you can create, edit and delete your projects, and you can create, move, manage keys and delete your tables. 

You probably don't want your users to have all of this power -- more likely, you just want them to be able to access the data in your tables. Moreover, you probably want to treat each of your projects separately. That way, users of one of your projects, "Jasmine's Car Sales Tracker", won't automatically have access to your other project, "Bob's Client List".

The way LiveCloud handles this is through __User Accounts__. For each one of your projects, you have a separate set of users that are authorized to access the data in that project. Users can access the data of a particular project (Read, Edit, Create, Delete), but don't have permission to modify any table schemas or create/delete tables. Moreover, user accounts can be required to have __Verified Emails__ prior to usage. This helps curb the creation of fake accounts.

To allow users to create accounts in your application or interact with your cloud application without an account, you must use user authentication. There are two different ways for you to set up user accounts in your application. First, you can set up a __Universal Account__, that all users of your application will use in order to be authenticated. This is for cloud-based applications that don't require any authentication, e.g. A public guidebook app. If you want each user to have their own login and to be authenticated, you'll need to set up your app with __Multiple User Accounts__.

## Universal Account
This method is for cloud-based applications that do not require users to create accounts.

### Creating User Account

1. Create a user account for your project with an email and password of your choosing. **Do not use your developer credentials or any personal information.** You will be hardcoding the email and password in your application. We use the [cdb_userAccount](CreateUserAccount.md) API to do this:

		# Required Parameters: 	pEmail, pPassword
		# Optional Parameters: 	pFirstName, pLastName, pPreVerify, pAutoAuth, pProjectName

		cdb_createUserAccount "email@email.com","fakepassword",,,true

2. Passing "true" as to pPreVerify will automatically verify this user account. This means you don't need to verify your email prior to using the account.

### Authorizing Your App

1. Call [cdb_auth](Auth.md) with the necessary parameters after the call to "initializeCanelaDB" in the "preOpenStack" of the application's stack script. Hardcode the email and password of the user account created in the "Creating User Accounts" section above in your stack script. This will authenticate the user with the hardcoded credentials when the application is opened.

		on preOpenStack
     		initializeCanelaDB
     		get cdb_auth(pEmail,pPassword,"user")
		end preOpenStack


## Multiple User Accounts
This method is for applications that require users to create an account.

### Creating User Account

1. Create a user interface to allow users to create accounts, or use the one provided by the LiveCloudManager. If you create your own, it must include fields for the following inputs unless indicated otherwise:
	* email
	* password
	* first name (optional)
	* last name (optional)
2. When users proceed to create an account, call [cdb_createUserAccount](CreateUserAccount.md) with the necessary parameters. If a user account with the provided email does not exist in the cdbUsers table for the specified project, it will create a new record in the that table.

		# Required Parameters:  pEmail, pPassword
		# Optional Parameters: 	pFirstName, pLastName, pPreVerified, pAutoAuth, pProjectName

		cdb_createUserAccount pEmail,pPassword,pFirstName,pLastName,pPreVerified,pAutoAuth,pProjectName

### User Account Verification
The "verified" key in user account records is **false** by default. When the user's account is created, an email with a link to verify the account is sent to the user's email. After the link is clicked, the "verified" key will change to **true**. If you want to automatically verify all your users, i.e. you don't want them to verify their emails, you can pass **true** to the parameter _pPreVerified_.

If you want the user to automatically be authenticated after creating an account, pass **true** to the parameter _pAutoAuth_. They will automatically be logged in as they create their account.

### User Authentication
This method is for applications that require users to log in.

1. Create a user interface to allow users to enter their email and password to log in.

2. When users proceed to log in, call [cdb_auth](Auth.md) with the necessary parameters. Use [cdb_result](Result.md) to check if the call was successful.

		get cdb_auth(pEmail,pPassword,"user")
	
		if not cdb_result() then
			answer "Failed to authenticate user - " & cdb_result("response")
		end if

