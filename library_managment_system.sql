CREATE TABLE authors
(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fullname VARCHAR (100) NOT NULL
);

CREATE TABLE books
(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    isbn VARCHAR(50) UNIQUE NOT NULL,
    publication VARCHAR(50) NOT NULL,
    language VARCHAR(50) NOT NULL,
    page VARCHAR(50) NOT NULL,
    subject_category VARCHAR(50) NOT NULL,
    author_id BIGINT UNSIGNED NOT NULL,
    
    CONSTRAINT FOREIGN KEY (author_id) REFERENCES authors(id)
);

CREATE TABLE catolog
(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    book_id BIGINT UNSIGNED NOT NULL,
    
    CONSTRAINT FOREIGN KEY (book_id) REFERENCES books(id)
);

CREATE TABLE book_items
(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    due_date DATE,
    book_format VARCHAR(50),
    book_id BIGINT UNSIGNED NOT NULL,
    created_at TIMESTAMP,
    
    CONSTRAINT FOREIGN KEY (book_id) REFERENCES books(id)
);

CREATE TABLE book_reservations
(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    book_id BIGINT UNSIGNED NOT NULL,
    created_at TIMESTAMP,
    status_reservation VARCHAR(50),
    book_item_id BIGINT UNSIGNED NOT NULL,
    CONSTRAINT FOREIGN KEY (book_item_id) REFERENCES book_items(id),
    CONSTRAINT FOREIGN KEY (book_id) REFERENCES books(id)
);

CREATE TABLE accounts
(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fullname VARCHAR(50) NOT NULL,
    login VARCHAR(25) UNIQUE NOT NULL,
    password VARCHAR (10) NOT NULL,
    status VARCHAR(25), 
    created_at TIMESTAMP,
    book_reservation_id BIGINT UNSIGNED NOT NULL,
    
    CONSTRAINT FOREIGN KEY (book_reservation_id) REFERENCES book_reservations(id)
);

CREATE TABLE members
(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fullname VARCHAR(50) NOT NULL,
    membership DATE NOT NULL,
    total_book_checked_out INT UNSIGNED NOT NULL,
    account_id BIGINT UNSIGNED NOT NULL,
    
    CONSTRAINT FOREIGN KEY (account_id) REFERENCES accounts(id)
);

CREATE TABLE librians
(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fullname VARCHAR(50) NOT NULL,
    account_id BIGINT UNSIGNED NOT NULL,
    
    CONSTRAINT FOREIGN KEY (account_id) REFERENCES accounts(id)
);

CREATE TABLE libraries
(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    adress VARCHAR(50) NOT NULL,
    book_item_id BIGINT UNSIGNED NOT NULL,
    
    CONSTRAINT FOREIGN KEY (book_item_id) REFERENCES book_items(id)
);

CREATE TABLE book_on_loan
(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    due_date DATE NOT NULL,
    return_date DATE,
    created_at TIMESTAMP,
    book_item_id BIGINT UNSIGNED NOT NULL,
    
    CONSTRAINT FOREIGN KEY (book_item_id) REFERENCES book_items(id)
);

CREATE TABLE penalties
(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    amount INT UNSIGNED,
    book_load_id BIGINT UNSIGNED NOT NULL,
    
    CONSTRAINT FOREIGN KEY (book_load_id) REFERENCES book_on_loan(id)
);

CREATE TABLE penalty_transaction
(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    amount INT UNSIGNED,
    created_at TIMESTAMP,
    penalty_id BIGINT UNSIGNED NOT NULL,
    
    CONSTRAINT FOREIGN KEY (penalty_id) REFERENCES penalties(id)
);

INSERT INTO authors 
(fullname)
VALUES
( 'Rowling'),
( 'Pushkin');

INSERT INTO books 
(title, isbn, publication, language, page, subject_category, author_id )
VALUES
('Harry Potter','9843-bn-943n', '2002-05-12', 'english', 'fantasy', 367, 1),
('Harry Potter 2','9863-an-843n', '2002-06-12', 'english', 'fantasy', 397, 1),
('Capitan Daugther','9243-bn-943n', '1836-01-01', 'russian', 'romans', 450, 2);

INSERT INTO book_items 
(due_date, book_format, book_id, created_at)
VALUES
('2022-03-06','Hardcover', 1, NOW()),
('2022-03-07','Hardcover', 2, NOW()),
('2022-03-10','Paperback', 3, NOW());

INSERT INTO catolog 
(title, book_id)
VALUES
('for teenages', 1),
('for teenages', 2),
('for school', 3);

INSERT INTO book_reservations
(book_id, created_at, status_reservation, book_item_id)
VALUES
(1,NOW(),'COMPLITE', 1),
(2,NOW(),'WAITING', 2),
(3,NOW(),'WAITING', 3);

INSERT INTO book_on_loan
(due_date, return_date, created_at, book_item_id)
VALUES
('2022-03-09', NULL, NOW(), 1),
('2022-03-15', NULL, NOW(), 2),
('2022-04-10', NULL, NOW(), 3);

INSERT INTO penalties
(amount, book_load_id)
VALUES
( NULL, 1),
( NULL, 2),
( NULL, 3);

INSERT INTO penalty_transaction
(amount, created_at, penalty_id )
VALUES
( NULL, NOW(), 1),
( NULL, NOW(), 2),
( NULL, NOW(), 3);


SELECT books.ttile, authors.fullname, book_reservations.created_at, book_items.due_date, account.fullname FROM book_items;