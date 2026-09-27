# Online Bookstore SQL Project

A beginner-to-intermediate SQL project built around an **online bookstore** database. The project demonstrates relational database design, CSV data loading, filtering, aggregation, joins, grouping, HAVING, sorting, and basic business analysis using SQL.

## Project Overview

The database contains three related tables:

- **Books** — book details, genre, publication year, price, and stock.
- **Customers** — customer contact and location information.
- **Orders** — orders connecting customers to books, including date, quantity, and total amount.

The supplied dataset contains **500 books, 500 customers, and 500 orders**.

## Database Schema

```text
Customers
---------
Customer_ID (PK)
Name
Email
Phone
City
Country
       |
       | 1-to-many
       v
Orders
------
Order_ID (PK)
Customer_ID (FK)
Book_ID (FK)
Order_Date
Quantity
Total_Amount
       ^
       | many-to-1
       |
Books
-----
Book_ID (PK)
Title
Author
Genre
Published_Year
Price
Stock
```

## SQL Concepts Covered

### Basic
- SELECT
- WHERE
- DISTINCT
- BETWEEN
- SUM()
- ORDER BY
- LIMIT

### Intermediate / Advanced
- INNER JOIN
- LEFT JOIN
- GROUP BY
- HAVING
- COUNT()
- AVG()
- COALESCE()
- Aggregate calculations
- Foreign keys
- Business-oriented SQL analysis

## Project Questions

### Basic Queries

1. Retrieve all books in the Fiction genre.
2. Find books published after 1950.
3. List customers from Canada.
4. Show orders placed in November 2023.
5. Calculate total available book stock.
6. Find the most expensive book.
7. Find orders containing more than one copy.
8. Find orders with a total amount above 20.
9. List all available genres.
10. Find the book with the lowest stock.
11. Calculate total revenue from all orders.

### Advanced Queries

1. Calculate books sold by genre.
2. Calculate the average Fantasy book price.
3. Find customers with at least two orders.
4. Find the most frequently ordered book.
5. Find the top three most expensive Fantasy books.
6. Calculate total books sold by author.
7. Find cities associated with orders above 30.
8. Find the highest-spending customer.
9. Calculate remaining stock after recorded orders.

## Repository Structure

```text
Online-Bookstore-SQL-Project/
│
├── README.md
├── sql/
│   ├── 01_database_setup.sql
│   ├── 02_data_import.sql
│   ├── 03_basic_queries.sql
│   └── 04_advanced_queries.sql
│
├── data/
│   ├── Books.csv
│   ├── Customers.csv
│   └── Orders.csv
│
└── screenshots/
    └── query-results/
```

## How to Run

### 1. Requirements

- MySQL 8.0+
- MySQL Workbench or another MySQL client

### 2. Create the database and tables

Run:

```sql
SOURCE sql/01_database_setup.sql;
```

Or open and execute the file in MySQL Workbench.

### 3. Import the CSV files

The easiest method in MySQL Workbench is **Table Data Import Wizard**. Import the files in this order:

1. `data/Books.csv`
2. `data/Customers.csv`
3. `data/Orders.csv`

The repository also contains `sql/02_data_import.sql` with a `LOAD DATA LOCAL INFILE` approach. Depending on your MySQL installation, `local_infile` may need to be enabled and the paths may need to be adjusted.

### 4. Run the queries

Run:

```text
sql/03_basic_queries.sql
sql/04_advanced_queries.sql
```

## Notes on Query Cleanup

The original project was converted to MySQL-compatible syntax for this repository. The original SQL used PostgreSQL-style `SERIAL` columns and machine-specific `COPY` paths. Those paths were removed so the repository can be shared without exposing a local Windows directory.

A few queries were also tightened to match their question wording. For example, the "most frequently ordered book" and "customer who spent the most" queries now return the single top result rather than a longer sorted list.

## Learning Outcomes

This project helped practice:

- Designing a simple relational database
- Creating primary-key and foreign-key relationships
- Loading structured CSV data
- Filtering records using WHERE
- Performing calculations with aggregate functions
- Joining related tables
- Grouping data for analysis
- Filtering grouped results with HAVING
- Answering practical business questions using SQL

## Portfolio Skills

**SQL | MySQL | Relational Databases | Data Analysis | Joins | Aggregations | GROUP BY | HAVING | Data Cleaning | Business Queries**

## Author

**Prajwal Mali**

B.Tech — Artificial Intelligence & Data Science
