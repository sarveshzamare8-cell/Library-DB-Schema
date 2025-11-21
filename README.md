# Library Database Schema

## Objective
To design and implement a normalized relational database for a **Library Management System**.  
This schema demonstrates understanding of **DDL**, **Normalization**, **Primary/Foreign Keys**, and **ER Diagrams**.

---

## Tools Used
- **MySQL Workbench** (for database creation & ER diagram)
- **GitHub** (for version control and submission)

---

## Database Overview
**Database Name:** `library_db`

**Entities:**
- `authors`
- `publishers`
- `categories`
- `books`
- `book_authors` (many-to-many bridge)
- `members`
- `loans`

**Relationships:**
- One publisher → many books  
- One category → many books  
- One author → many books (via `book_authors`)  
- One member → many loans  
- One book → many loans (over time)

---

## Schema Structure
Each table includes primary keys, foreign keys, and constraints to maintain referential integrity.

### Example Tables:
```sql
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);

CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    publisher_id INT,
    category_id INT,
    publication_year YEAR,
    available_copies INT DEFAULT 1,
    FOREIGN KEY (publisher_id) REFERENCES publishers(publisher_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);
---

### Task 2: Data Insertion & NULL Handling

### What I Completed
- Inserted sample records into tables (publishers, categories, authors, books, book_authors, members, loans).
- Handled NULL values (checked with `IS NULL`, used `COALESCE`).
- Performed UPDATE and DELETE safely (used WHERE on keys).
- Demonstrated transactions (`START TRANSACTION`, `COMMIT`, `ROLLBACK`).
- Used `INSERT ... ON DUPLICATE KEY UPDATE` (modern alias syntax recommended).
- Added `task2_inserts.sql` containing all the above operations.

### Files Added
- `task2_inserts.sql` — Task 2 SQL script

## 📗 Task 3: SELECT Queries (Data Retrieval)

I added `task3_selects.sql` which demonstrates common SELECT operations:
- Basic `SELECT *` and selecting specific columns
- `WHERE`, `LIKE`, `BETWEEN`, `IN`
- `JOIN` (including many-to-many join via bridge table)
- Aggregation (`COUNT`, `GROUP BY`, `HAVING`)
- `DISTINCT`, `ORDER BY`, `LIMIT`
- NULL handling using `IS NULL` and `COALESCE`
- Computed columns and `CASE` usage

## Task 4: Aggregate Functions & Grouping

This task focuses on using aggregate functions and grouping to summarize data.

### Concepts Practiced
- `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
- `GROUP BY` for grouping data
- `HAVING` for filtering groups
- `GROUP_CONCAT` for combining multiple values
- Joins with aggregation

### Deliverable
- Added `task4_aggregates.sql` containing all aggregate and grouping queries.

## 📘 Task 5: SQL Joins (INNER, LEFT, RIGHT, FULL)

This task demonstrates combining records from related tables using JOIN operations.

### ✔️ Concepts Practiced
- `INNER JOIN` to fetch matching records
- `LEFT JOIN` to fetch all records from the left table
- `RIGHT JOIN` for all records from the right table
- `FULL OUTER JOIN` (simulated using `UNION` since MySQL doesn't support FULL JOIN)
- Multi-table joins (books, authors, publishers)
- Many-to-many join via `book_authors`

### ✔️ Deliverable
- `task5_joins.sql` uploaded in repository

## 📘 Task 6: Subqueries and Nested Queries

This task demonstrates the use of:
- Scalar subqueries
- Subqueries inside `WHERE`, `IN`, `EXISTS`
- Correlated subqueries
- Nested subqueries
- Subqueries inside `FROM` (derived tables)

### ✔️ Deliverable
`task6_subqueries.sql` file containing all required subqueries.

