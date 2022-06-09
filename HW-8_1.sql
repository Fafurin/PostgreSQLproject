CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  middle_name VARCHAR(50),
  phone VARCHAR(15) UNIQUE NOT NULL,
  email VARCHAR(50) UNIQUE
);

CREATE TYPE book_status AS ENUM ('standing_by','in_work','in_archive');

CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  book_format_id INT NOT NULL,
  authors_wishes VARCHAR(255) NOT NULL,
  status book_status
);

CREATE TABLE books_authors (
  book_id SERIAL,
  author_id SERIAL
); 

CREATE TABLE books_files (
  book_id SERIAL,
  manuscript VARCHAR(150) NOT NULL,
  interim_version VARCHAR(150) NOT NULL,
  finished_version VARCHAR(150) NOT NULL
);

CREATE TABLE books_formats (
  id INT PRIMARY KEY,
  book_format CHAR(20)
);

CREATE TABLE deadlines (
  production_id SERIAL,
  start_date DATE,
  interim_date DATE,
  finish_date DATE
);

CREATE TABLE output_information (
  book_id SERIAL,
  ISBN_or_ISSN INT,
  order_number INT,
  conv_print_sheets DECIMAL(5,2),
  publishing_sheets DECIMAL(5,2),
  publishing_date DATE
);

CREATE TABLE production (
  id SERIAL PRIMARY KEY,
  book_id SERIAL,
  staff_id INT NOT NULL
);

CREATE TABLE profiles (
  id SERIAL PRIMARY KEY,
  date_of_birth DATE,
  education VARCHAR(100),
  started_at DATE,
  address varchar(100)
);

CREATE TABLE staff (
  id SERIAL PRIMARY KEY,
  first_name varchar(50),
  last_name varchar(50),
  position_id INT,
  profile_id INT
);

CREATE TABLE staff_positions (
  id SERIAL PRIMARY KEY,
  position varchar(15)
);




