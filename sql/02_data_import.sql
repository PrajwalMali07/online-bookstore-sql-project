-- Online Bookstore SQL Project
-- DBMS: MySQL 8.0+
--
-- Option A: Import the CSV files using MySQL Workbench's Table Data Import Wizard.
-- Recommended order: Books -> Customers -> Orders (Orders contains foreign keys).
--
-- Option B: Use LOAD DATA LOCAL INFILE after enabling local_infile.
-- Replace the paths below with the actual location of this repository on your computer.

USE bookstore;

-- Books.csv
LOAD DATA LOCAL INFILE 'data/Books.csv'
INTO TABLE Books
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Book_ID, Title, Author, Genre, Published_Year, Price, Stock);

-- Customers.csv
LOAD DATA LOCAL INFILE 'data/Customers.csv'
INTO TABLE Customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Customer_ID, Name, Email, Phone, City, Country);

-- Orders.csv
LOAD DATA LOCAL INFILE 'data/Orders.csv'
INTO TABLE Orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount);

-- Row-count checks
SELECT 'Books' AS table_name, COUNT(*) AS row_count FROM Books
UNION ALL
SELECT 'Customers', COUNT(*) FROM Customers
UNION ALL
SELECT 'Orders', COUNT(*) FROM Orders;
