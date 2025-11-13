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

