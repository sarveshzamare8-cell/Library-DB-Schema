-- task2_inserts.sql
USE library_db;


INSERT INTO publishers (publisher_name, address) VALUES ('Penguin Books','375 Hudson St, NY'), ('HarperCollins','195 Broadway, NY');
INSERT INTO categories (category_name) VALUES ('Fiction'),('Science'),('History');
INSERT INTO authors (author_name, country) VALUES ('George Orwell','United Kingdom'), ('J.K. Rowling','United Kingdom'), ('Mark Twain','United States');

INSERT INTO books (title, publisher_id, category_id, publication_year, available_copies) VALUES
('1984', 9, 1, 1949, 5),
('Harry Potter and the Philosopher''s Stone', 10, 1, 1997, 3),
('Adventures of Tom Sawyer', 11, 1, 1876, 2),
('Uncategorized Book', 12, NULL, NULL, NULL);


INSERT INTO book_authors (book_id, author_id) VALUES (9,1),(10,2),(11,3);


INSERT INTO members (member_name, email, phone) VALUES ('Aman Sharma','aman@example.com','9876543210'),('Priya Verma','priya@example.com','9123456780');


INSERT INTO loans (book_id, member_id, loan_date, return_date) VALUES (9,1,'2025-11-01',NULL),(10,2,'2025-11-05','2025-11-12');
