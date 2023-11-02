CREATE TABLE library (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(100) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    phone VARCHAR(15)
);


CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(50) NOT NULL,
    year INTEGER NOT NULL CHECK (year > 0),
    isbn VARCHAR(32) NOT NULL,
    publisher VARCHAR(50) NOT  NULL,
    category VARCHAR(50) NOT NULL,
    library_id INTEGER REFERENCES library(id)
);


CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    profession VARCHAR(255) NOT NULL DEFAULT '-',
    phone VARCHAR(15) NOT NULL ,
    address VARCHAR(100) NOT NULL,
    birth_date DATE CHECK (birth_date < CURRENT_DATE)
);

CREATE TABLE borrowings (
    id SERIAL PRIMARY KEY,
    book_id INTEGER REFERENCES books(id),
    user_id INTEGER REFERENCES users(id),
    start_date DATE NOT NULL DEFAULT CURRENT_DATE,
    end_date DATE,
    returned BOOLEAN NOT NULL DEFAULT FALSE
);


