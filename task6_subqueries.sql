USE library_db;

SELECT book_id, title, publication_year
FROM books
WHERE publication_year > (
    SELECT AVG(publication_year) FROM books
);

SELECT b.book_id, b.title
FROM books b
WHERE b.book_id IN (
    SELECT ba.book_id
    FROM book_authors ba
    JOIN authors a ON ba.author_id = a.author_id
    WHERE a.country = 'United Kingdom'
);

SELECT a.author_id, a.author_name
FROM authors a
WHERE EXISTS (
    SELECT 1
    FROM book_authors ba
    WHERE ba.author_id = a.author_id
);

SELECT b.book_id, b.title,
       (SELECT COUNT(*) 
        FROM book_authors ba
        WHERE ba.book_id = b.book_id) AS total_authors
FROM books b;

SELECT title, times_loaned
FROM (
    SELECT b.title, COUNT(l.loan_id) AS times_loaned
    FROM books b
    LEFT JOIN loans l ON b.book_id = l.book_id
    GROUP BY b.book_id, b.title
    ORDER BY times_loaned DESC
) AS loan_summary
LIMIT 2;

SELECT m.member_id, m.member_name
FROM members m
WHERE m.member_id IN (
    SELECT l.member_id
    FROM loans l
    WHERE l.book_id IN (
        SELECT ba.book_id
        FROM book_authors ba
        JOIN authors a ON ba.author_id = a.author_id
        WHERE a.author_name = 'Mark Twain'
    )
);

SELECT *
FROM books
WHERE available_copies = (
    SELECT MAX(available_copies) FROM books
);

-- END OF TASK 6
