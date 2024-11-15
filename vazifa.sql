----1
CREATE TABLE authors (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    bio TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

---2
CREATE TABLE books (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(100),
    summary TEXT,
    published_date DATE,
    metadata JSON,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

---3
CREATE TABLE publishers (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100),
    country CHAR(2),
    founded_year INTEGER,
    details JSON,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

---4
CREATE TABLE libraries (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100),
    location TEXT,
    open_time TIME,
    close_time TIME,
    facilities JSON,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

---5
CREATE TABLE author_book (
    author_id UUID REFERENCES authors(id) ON DELETE CASCADE,
    book_id UUID REFERENCES books(id) ON DELETE CASCADE,
    PRIMARY KEY (author_id, book_id)
);

CREATE TABLE book_publisher (
    book_id UUID REFERENCES books(id) ON DELETE CASCADE,
    publisher_id UUID REFERENCES publishers(id) ON DELETE CASCADE,
    PRIMARY KEY (book_id, publisher_id)
);

CREATE TABLE library_book (
    library_id UUID REFERENCES libraries(id) ON DELETE CASCADE,
    book_id UUID REFERENCES books(id) ON DELETE CASCADE,
    PRIMARY KEY (library_id, book_id)
);
