USE library_db;

SELECT COUNT(*) AS total_books
FROM books;


SELECT c.category_name, COUNT(b.book_id) AS books_in_category
FROM categories c
LEFT JOIN books b ON c.category_id = b.category_id
GROUP BY c.category_name;


SELECT SUM(available_copies) AS total_available_copies
FROM books;


SELECT p.publisher_name, SUM(b.available_copies) AS total_copies
FROM publishers p
JOIN books b ON p.publisher_id = b.publisher_id
GROUP BY p.publisher_id, p.publisher_name;


SELECT AVG(publication_year) AS avg_publication_year
FROM books;


SELECT c.category_name, AVG(b.publication_year) AS avg_year
FROM categories c
LEFT JOIN books b ON c.category_id = b.category_id
GROUP BY c.category_name;


SELECT MIN(publication_year) AS oldest_year,
       MAX(publication_year) AS newest_year
FROM books;


SELECT c.category_name, COUNT(b.book_id) AS total_books
FROM categories c
LEFT JOIN books b ON c.category_id = b.category_id
GROUP BY c.category_name
HAVING total_books > 1;

SELECT b.title, COUNT(l.loan_id) AS times_loaned
FROM books b
LEFT JOIN loans l ON b.book_id = l.book_id
GROUP BY b.book_id, b.title;


SELECT m.member_name, COUNT(l.loan_id) AS loan_count
FROM members m
LEFT JOIN loans l ON m.member_id = l.member_id
GROUP BY m.member_id, m.member_name
HAVING loan_count > 1;


SELECT b.title,
       GROUP_CONCAT(a.author_name SEPARATOR ', ') AS authors
FROM books b
LEFT JOIN book_authors ba ON b.book_id = ba.book_id
LEFT JOIN authors a ON ba.author_id = a.author_id
GROUP BY b.book_id, b.title;
