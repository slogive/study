CREATE TABLE IF NOT EXISTS books (
  book_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  author_id INTEGER UNSIGNED,
  title VARCHAR(100) NOT NULL,
  `year` INTEGER UNSIGNED NOT NULL DEFAULT 1900,
  language VARCHAR(2) NOT NULL DEFAULT 'us' COMMENT 'ISO 639-1 Language',
  cover_url VARCHAR(500),
  price DOUBLE(6, 2) NOT NULL DEFAULT 10.0,
  sellable TINYINT(1) DEFAULT 1,
  copies INTEGER NOT NULL DEFAULT 1,
  description TEXT,
);
--
CREATE TABLE IF NOT EXISTS author (
  author_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  nationality VARCHAR(3)
);
--
DROP TABLE author;
DESCRIBE author;
--
DESC author;
SHOW FULL COLUMNS
FROM books;
--
CREATE TABLE clients (
  client_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  birthdate DATETIME,
  gender ENUM('M', 'F', 'PNS') NOT NULL,
  active TINYINT(1) NOT NULL DEFAULT 1,
  create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'yyyy-mm-dd hh:mm:ss',
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
--
CREATE TABLE operations (
  operation_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  book_id INTEGER UNSIGNED,
  client_id INTEGER UNSIGNED,
  `type` ENUM('P', 'V', 'D') NOT NULL DEFAULT 'V' COMMENT 'P=prestado, V=vendido, D=devuelto',
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  finished TINYINT(1) NOT NULL
);
--
INSERT INTO author(name, nationality)
VALUES('Maria Teresa', 'CO'),
  ('Cesar Fonseca', 'CO');
--
INSERT INTO author(author_id, name)
VALUES(16, 'Yamit Fonseca');
--
INSERT INTO clients(
    client_id,
    name,
    email,
    birthdate,
    gender,
    active
  )
VALUES (
    1,
    'Maria Dolores Gomez',
    'Maria Dolores.95983222J@random.names',
    '1971-06-06',
    'F',
    1
  ),
  (
    2,
    'Adrian Fernandez',
    'Adrian.55818851J@random.names',
    '1970-04-09',
    'M',
    1
  ),
  (
    3,
    'Maria Luisa Marin',
    'Maria Luisa.83726282A@random.names',
    '1957-07-30',
    'F',
    1
  ),
  (
    4,
    'Pedro Sanchez',
    'Pedro.78522059J@random.names',
    '1992-01-31',
    'M',
    1
  );
--
INSERT INTO clients(`name`, email, birthdate, gender, active)
VALUES(
    'Maria Dolores Gomez',
    'Maria Dolores.95983222J@random.names',
    '1971-06-06',
    'F',
    0
  ) ON DUPLICATE KEY
UPDATE active =
VALUES(active);
--
SELECT *
from clients
WHERE client_id = 4 \ G
INSERT INTO books(
    book_id,
    author_id,
    title,
    `year`,
    `language`,
    cover_url,
    price,
    sellable,
    copies,
    `description`
  )
VALUES(
    '1',
    '3',
    'El Laberinto de la Soledad',
    1900,
    'es',
    '',
    15.0,
    1,
    1,
    ''
  );
--
INSERT INTO books(title, author_id, `year`)
VALUES(
    'Vuelta al Laberinto de la soledad',
    (
      SELECT author_id
      FROM author
      WHERE name = 'Cesar Fonseca'
      LIMIT 1
    ), 1960
  );
--
SELECT client_id,
  name
FROM clients;
--
SELECT client_id,
  name
FROM clients
LIMIT 10;
--
SELECT name,
  email,
  gender
FROM clients
where gender = 'M';
--
SELECT name,
  email,
  gender
FROM clients
where gender = 'F';
--
SELECT year(birthdate)
FROM clients;
--
SELECT YEAR(NOW()) - YEAR(birthdate)
FROM clients;
--
SELECT name,
  YEAR(NOW()) - YEAR(birthdate)
FROM clients;
--
SELECT *
FROM clients
WHERE name LIKE '%Saave%';
--
SELECT `name`,
  email,
  YEAR(NOW()) - YEAR(birthdate) AS age,
  gender
FROM clients
WHERE gender = 'F'
  AND `name` LIKE '%Lop%';
--
SELECT COUNT(*)
FROM books;
--
SELECT *
FROM authors
WHERE author_id > 0
  AND author_id <= 5;
--
SELECT *
FROM books
WHERE author_id BETWEEN 1 AND 5;
--
SELECT book_id,
  author_id,
  title
FROM books
WHERE author_id BETWEEN 1 AND 5;
--
SELECT b.book_id,
  a.name,
  a.author_id,
  b.title
FROM books as b
  JOIN authors as a ON a.author_id = b.author_id
WHERE a.author_id BETWEEN 1 AND 5;
--
SELECT c.name,
  b.title,
  t.type
FROM transactions as t
  JOIN books as b ON t.book_id = b.book_id
  JOIN clients as c ON t.client_id = c.client_id;
--
ALTER TABLE transactions
MODIFY COLUMN `type` enum('sell', 'lend', 'return') NOT NULL
AFTER client_id;
--
SELECT c.name,
  b.title,
  t.type
FROM transactions as t
  JOIN books as b ON t.book_id = b.book_id
  JOIN clients as c ON t.client_id = c.client_id
WHERE c.gender = 'F'
  AND t.type = 'sell';
--
SELECT c.name AS `Client Name`,
  b.title AS `Book Title`,
  t.type AS `Status`
FROM transactions as t
  JOIN books as b ON t.book_id = b.book_id
  JOIN clients as c ON t.client_id = c.client_id
  JOIN authors as a ON b.author_id = a.author_id
WHERE c.gender = 'M'
  AND t.type in ('sell', 'lend');