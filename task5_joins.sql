USE library_db;

SELECT b.book_id, b.title, p.publisher_name
FROM books b
INNER JOIN publishers p ON b.publisher_id = p.publisher_id;

   
SELECT b.book_id, b.title, a.author_name
FROM books b
INNER JOIN book_authors ba ON b.book_id = ba.book_id
INNER JOIN authors a ON ba.author_id = a.author_id;

SELECT b.book_id, b.title, c.category_name
FROM books b
LEFT JOIN categories c ON b.category_id = c.category_id;

SELECT m.member_id, m.member_name, l.loan_id, l.loan_date
FROM members m
LEFT JOIN loans l ON m.member_id = l.member_id
ORDER BY m.member_id;

SELECT p.publisher_id, p.publisher_name, b.title
FROM books b
RIGHT JOIN publishers p ON b.publisher_id = p.publisher_id;

SELECT b.book_id, b.title, c.category_name
FROM books b
LEFT JOIN categories c ON b.category_id = c.category_id

UNION

SELECT b.book_id, b.title, c.category_name
FROM books b
RIGHT JOIN categories c ON b.category_id = c.category_id;

SELECT b.book_id, b.title, p.publisher_name,
       GROUP_CONCAT(a.author_name SEPARATOR ', ') AS authors
FROM books b
LEFT JOIN publishers p ON b.publisher_id = p.publisher_id
LEFT JOIN book_authors ba ON b.book_id = ba.book_id
LEFT JOIN authors a ON ba.author_id = a.author_id
GROUP BY b.book_id, b.title, p.publisher_name;

-- END OF TASK 5
