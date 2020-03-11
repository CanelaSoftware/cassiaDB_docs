## CanelaDB API Documentation
=========

This project is designed to give a detailed overview of the API calls available in the CanelaDB database and related cloud service (LiveCloud).

You can view the API docs online here: 
<http://canelasoftware.github.io/cassiaDB_docs/>

The API can also be found in Markdown format in the "docs" Folder.

## Editing the project
This project is build using [MKDocs](http://www.mkdocs.org/). To make doc modifications, you will need to have [mkdocs installed](http://www.mkdocs.org/#installation). Then, checkout master branch, make updates to .md files (under "docs"), and commit. To view locally, use `mkdocs serve`. To deploy, use `mkdocs build`. Copy the contents of the "site" folder to /var/www/docs/html/ on livecloud.io server.

(see http://www.mkdocs.org/user-guide/deploying-your-docs/) .

Steps
1. Open terminal and set path to gitHub repo for cassiaDB_docs
2. Modify .md file in 'docs' folder in your favorite text or markdown editor
3. If this is a new file, you will need to update mkdocs.yml
4. Build changes to html folder with: 'mkdocs build --clean' in terminal
5. Test updated file with: 'mkdocs serve' in terminal
6. Upload changed files to /var/www/docs/html/ on livecloud.io server
