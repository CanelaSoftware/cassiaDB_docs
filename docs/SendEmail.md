# command cdb_sendEmail pToI, pFrom, pSubject, *pHTMLBody*, *pTextBody*, *pAttachmentName*, *pAttachmentContent*
---

## Summary
This command will send an email with the specified parameters

## Inputs
* **pToI** *(String)* - Comma-delimited list of email address(es) to send emails to. 
* **pFrom** *(String)* - Email address of the sender.
* **pSubject** *(String)* - Subject of the email.
* \***pHTMLBody** *(String)* - HTML content of email.
* \***pTextBody** *(String)* - Text content of email (multipart is used, so this can be used as a fallback if HTML fails/is empty).
* \***pAttachmentName** *(String)* - If we have an attachment, the name of the attachment.
* \***pAttachmentContent** *(Data)* - If we have an attachment, the content of the attachment.

> \* _optional parameter_

## Additional Requirements
This API call requires internet access.

## Examples
```livecodeserver
cdb_sendEmail "cora@fakeemail.com","bob@mycompany.com","Hello!","<p>This is the HTML Body!</p>","This is the Text Body."

# Email will be sent from Bob to Cora with subject "Hello!"
``` 
```livecodeserver
local tAttachment

# Load our attachment into memory
put url("binfile:attachment.pdf") into tAttachment

cdb_sendEmail "cora@fakeemail.com","bob@mycompany.com","Email with Attachment",,"This has an attachment","name.pdf",tAttachment

# Email will be sent from Bob to Cora with attachment "name.pdf"
``` 