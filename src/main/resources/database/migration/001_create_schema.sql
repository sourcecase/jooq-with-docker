CREATE DATABASE `library`;

USE `library`;

CREATE TABLE `language` (
  id int NOT NULL,
  cd varchar(2) NOT NULL,
  description varchar(50),
  PRIMARY KEY (`id`)
);

CREATE TABLE `author` (
  id int NOT NULL,
  first_name varchar(255) DEFAULT NULL,
  last_name varchar(255) NOT NULL,
  date_of_birth Date,
  year_of_birth int,
  distinguished int,
  PRIMARY KEY (`id`)
);

CREATE TABLE `book` (
  id int NOT NULL,
  author_id int NOT NULL,
  title varchar(400) NOT NULL,
  published_in int NOT NULL,
  language_id int NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT fk_book_author     FOREIGN KEY (author_id)   REFERENCES author(id),
  CONSTRAINT fk_book_language   FOREIGN KEY (language_id) REFERENCES language(id)
);

CREATE TABLE `book_store` (
  name varchar(400) NOT NULL UNIQUE,
  PRIMARY KEY (`name`)
);

CREATE TABLE `book_to_book_store` (
  book_store_name varchar(400) NOT NULL,
  book_id int NOT NULL,
  stock int,
  PRIMARY KEY(book_store_name, book_id),
  CONSTRAINT fk_b2bs_book_store FOREIGN KEY (book_store_name)        REFERENCES book_store (name) ON DELETE CASCADE,
  CONSTRAINT fk_b2bs_book       FOREIGN KEY (book_id)     REFERENCES book (id)         ON DELETE CASCADE
);