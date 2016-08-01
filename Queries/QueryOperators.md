##Query Operators
The following are the valid options for the `["operator"]` parameter of a query statement.

* `"~"` - A key’s contents contains the ‘value’
* `"!~"` - A key’s contents does not contain the ‘value’
* `"="` - A key’s contents is equal to the ‘value’
* `"!="` - A key’s contents is not equal to the ‘value’
* `"starts with"` - A key’s contents begins with the ‘value’
* `"ends with"` - A key’s contents ends with the ‘value’
* `">"` - A key’s contents are greater than the ‘value’ (non-numeric contents are ignored)
* `"<"` - A key’s contents are less than the ‘value’ (non-numeric contents are ignored)
* `">="` - A key’s contents are greater than or equal to the ‘value’ (non-numeric contents are ignored)
* `"<="` - A key’s contents are less than or equal to the ‘value’ (non-numeric contents are ignored)
* `"regex"` - A key’s contents matches the ‘value’ regular expression