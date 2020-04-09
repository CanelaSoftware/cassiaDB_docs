## CanelaDB API Documentation
=========

This project is designed to give a detailed overview of the API calls available in the CanelaDB database and related cloud service (LiveCloud).

You can view the API docs online here: 
<http://canelasoftware.github.io/cassiaDB_docs/>

The API can also be found in Markdown format in the "docs" Folder.

## Editing the project
This project is build using [MKDocs](http://www.mkdocs.org/). To make doc modifications, you will need to have [mkdocs installed](http://www.mkdocs.org/#installation). Then, checkout master branch, make updates to .md files (under "docs"), and commit. To view locally, use `mkdocs serve`. To deploy, use `mkdocs build`. Copy the contents of the "site" folder to /var/www/docs/html/ on livecloud.io server.

(see http://www.mkdocs.org/user-guide/deploying-your-docs/) .

Terminal
1. Open terminal and set path to gitHub repo for cassiaDB_docs

Edit existing file
1. Modify .md file in 'docs' folder in your favorite editor
2. Rebuild the html files by typing in the terminal: mkdocs build 

Add new file
1. Create or edit existing file for new doc 
2. You will need to update mkdocs.yml with new doc filename
3. Build changes to html folder. In terminal type: mkdocs build --clean

Running a local server to test your work
1. Set the path of terminal to the cassiaDB_docs folder.
2. In terminal type: mkdocs serve
3. Point your browser to: http://127.0.0.1:8000/
Every time you save a change the the documentation file, your browser will auto-refresh to see the local changes. You do not need to run 'mkdocs build'. This is only for pushing your changes to the cloud.

Upload files to cloud
2. Upload changed files to /var/www/docs/html/ on livecloud.io server after running the appropriate mkdocs build method.
