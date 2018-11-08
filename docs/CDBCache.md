## What is the CDBCache?

The CDBCache allows developers to stop worrying about internet connectivity when making cloud transactions. It will automatically save any cloud-write transactions that fail, and those transactions will be processed once the user has reconnected to the internet. This means that any time your users lose their internet connection, CassiaDB will cache this transaction. The transactions are saved even if the application shuts down, so you never have to worry about missing your cloud calls.

### Using the CDBCache

The CDBCache is turned ON by default. If you don't want to use the CDBCache (i.e. you want to handle cloud failures manually), you can set the global variable gCache to "false".

### What Transactions are saved in the CDBCache?

- [cdb_create](Create.md)
- [cdb_batchCreate](BatchCreate.md)
- [cdb_delete](Delete.md)
- [cdb_batchDelete](BatchDelete.md)
- [cdb_deleteKeys](DeleteKeys.md)
- [cdb_batchDeleteKeys](BatchDeleteKeys.md)
- [cdb_update](Update.md)
- [cdb_batchUpdate](BatchUpdate.md)
- [cdb_batchMerge](BatchMerge.md)
- [cdb_sync](Sync.md)