# SQL & MySQL

CREATE database operation; 

CREATE DATABASE IF NOT EXISTS operator;

SHOW warnings;

show databases;

use operation;

show tables;

<!--><!-->

CREATE TABLE IF NOT EXISTS books (
  book_id INTENGER
);

### Load sql

```bash
mysql -u root -p < generate.sql
```

### Insert into table

```bash
mysql -u root -p -D curso < insert.sql
```