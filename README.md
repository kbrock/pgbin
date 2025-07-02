This is a collection of postgres utilities.
Many of them are the name of typical unix utilities with a p appended to the beginning

| command |usage|
|---------|-----|
| pbak    | backs up a database. you can then restore it between running tests|
| pchown  | change the ownership of a postgres database|
| pcol    | list all references for a column across all tables|
| pcp     | copy a database. NOTE: This is much quicker than dump/restore|
| pdu     | space (disk usage) of all databases, or all tables in a database, or of a single table
| pmv     | rename a database |
| pstat   | show vacuum statistics |
| ptop    | show processes in a database |
