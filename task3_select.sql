USE library_db;

SHOW TABLES;


SELECT * FROM books;


SELECT book_id, title, publication_year, available_copies FROM books;



SELECT title, publication_year FROM books WHERE publication_year > 1950 ORDER BY publication_year;


SELECT b.book_id, b.title, p.publisher_name
FROM books b
JOIN publishers p ON b.publisher_id = p.publisher_id
WHERE b.publisher_id = 1;


SELECT book_id, title FROM books WHERE title LIKE '%Harry%';


SELECT title, publication_year FROM books WHERE publication_year BETWEEN 1900 AND 2000;


SELECT b.title, c.category_name FROM books b
JOIN categories c ON b.category_id = c.category_id
WHERE b.category_id IN (1,2);


SELECT book_id, title, publisher_id, category_id FROM books WHERE publisher_id IS NULL OR category_id IS NULL;


SELECT title, COALESCE((SELECT publisher_name FROM publishers WHERE publishers.publisher_id = books.publisher_id), 'Unknown') AS publisher
FROM books;


SELECT b.book_id, b.title, a.author_id, a.author_name
FROM books as b
JOIN book_authors as ba ON b.book_id = ba.book_id
JOIN authors as a ON ba.author_id = a.author_id
ORDER BY b.book_id;


SELECT c.category_name, COUNT(b.book_id) AS book_count
FROM categories c
LEFT JOIN books b ON c.category_id = b.category_id
GROUP BY c.category_name
ORDER BY book_count DESC;

SELECT m.member_id, m.member_name, COUNT(l.loan_id) AS loans_count
FROM members m
LEFT JOIN loans l ON m.member_id = l.member_id
GROUP BY m.member_id, m.member_name
HAVING loans_count > 0;



SELECT DISTINCT p.publisher_name
FROM publishers p
JOIN books b ON p.publisher_id = b.publisher_id;


SELECT title, publication_year FROM books
WHERE publication_year IS NOT NULL
ORDER BY publication_year DESC
LIMIT 5;


SELECT member_id, member_name, email FROM members WHERE email LIKE '%@example.com' OR member_name LIKE '%Aman%';


SELECT book_id, title, available_copies,
       CASE WHEN available_copies > 0 THEN 'Available' ELSE 'Not Available' END AS status
FROM books;


SELECT b.book_id, b.title, p.publisher_name,
       GROUP_CONCAT(a.author_name SEPARATOR ', ') AS authors
FROM books b
LEFT JOIN publishers p ON b.publisher_id = p.publisher_id
LEFT JOIN book_authors ba ON b.book_id = ba.book_id
LEFT JOIN authors a ON ba.author_id = a.author_id
GROUP BY b.book_id, b.title, p.publisher_name;


SELECT DISTINCT m.member_id, m.member_name
FROM members m
JOIN loans l ON m.member_id = l.member_id
WHERE l.return_date IS NULL;

-- END of task3_selects.sql
