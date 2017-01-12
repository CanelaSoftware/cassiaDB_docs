CassiaDB API Documentation
=========


This project is designed to give a detailed overview of the API calls available in the CassiaDB database and related cloud service (LiveCloud).

You can view the API docs online here: 
[http://canelasoftware.github.io/cassiaDB_docs/](http://canelasoftware.github.io/cassiaDB_docs/)

## To Build HTML from MD for GH-pages:

- npm install -g Showdown
- Update Showdown (global install, /usr/local/lib/node_modules/showdown/src/cli/makehtml.cmd.js):
      converter.setOption('noHeaderId','true');
add that to line 94 of makehtml.cmd.js
- run create.sh
- create list.html:

````
ul.inner-nav-list>li.inner-nav-element*>a[href="#$#"]>{$#}
a[href=#$#]{$#}
li.nav
````
- bump down Headers from sourced MD:
replace `<h2>([^#].+)</h2>` with `<h3>$1</h3>`
replace `<h2># ` with `<h2>` (not sure why showdown does this, should really create `<h1>`)

- Combine template.html, list.html, and full.html to create index.html