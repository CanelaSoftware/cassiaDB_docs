## What is the LiveCache?

The livecache is a feature of CassiaDB that allows developers to stop worrying about internet connectivity when making cloud transactions. It will automatically save any cloud writeable transactions that don't go through, so they will be updated at a later time.

### Using the LiveCache

Livecaching is turned ON by default. This means that any time a cloud write transaction (Create, Update, Delete, Merge) fails, CassiaDB will cache this transaction, and attempt the transaction again the next time it has internet connectivity. This persists even if the application shuts down, so you never have to worry about missing your cloud calls.

### Opting out of LiveCache

If you don't want to use the Livecache (i.e. you want to handle cloud failures manually), you can pass the `"cdbDoNotUseLiveCache"` key in your input arrays to prevent the livecache from keeping track of your cloud transactions.