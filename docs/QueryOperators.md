##Query Operators
The following are the valid options for the `["operator"]` parameter of a [query](Query.md) statement.

* `"~"` - A key’s contents contains the ‘value’. Synonyms: `":"`,`"is in"`,`"contains"`
* `"!~"` - A key’s contents does not contain the ‘value’. Synonyms: `"!:"`,`"is not in"`,`"does not contain"`
* `"="`- A key’s contents is equal to the ‘value’. Synonyms: `"equal to"`,`"equals"`,`"is"`
* `"!="` - A key’s contents is not equal to the ‘value’. Synonyms: `"<>"`,`"not equal to"`,`"does not equal"`,`"is not"`
* `"["` - A key’s contents begins with the ‘value’. Synonyms: `"starts with"`,`"begins with"`
* `"]"` - A key’s contents ends with the ‘value’. Synonyms: `"finishes with"`,`"ends with"`
* `">"` - A key’s contents are greater than the ‘value’ (non-numeric contents are ignored). Synonyms: `"gt"`,`"greater than"`
* `"<"` - A key’s contents are less than the ‘value’ (non-numeric contents are ignored). Synonyms: `"lt"`,`"less than"`
* `">="` - A key’s contents are greater than or equal to the ‘value’ (non-numeric contents are ignored). Synonyms: `"ge"`,`"greater than or equal to"`
* `"<="` - A key’s contents are less than or equal to the ‘value’ (non-numeric contents are ignored). Synonyms: `"le"`,`"less than or equal to"`
* `"date>"` - A key's contents are later than than the datetime of the 'value' (non-dateitems contents are ignored).
* `"date<"` - A key's contents are earlier than the datetime of the 'value' (non-dateitems contents are ignored).
* `"date<="` - A key's contents are earlier or the same as the datetime of the 'value' (non-dateitems contents are ignored).
* `"date>="` - A key's contents are later or the same as the datetime of the 'value' (non-dateitems contents are ignored).
* `"date="` - A key's contents are equal to the datetime of the 'value' (non-dateitems contents are ignored).
* `"date!="` - A key's contents are not equal to the datetime of the 'value' (non-dateitems contents are ignored).
* `"regex"` - A key’s contents matches the ‘value’ regular expression. Synonyms: `"matchText"`
* `"filter"` - A key's contents match the 'value' filter.