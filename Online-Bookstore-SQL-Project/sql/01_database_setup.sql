-- Online Bookstore SQL Project
-- DBMS: MySQL 8.0+

CREATE DATABASE IF NOT EXISTS bookstore;
USE bookstore;

DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Books;

CREATE TABLE Books (
    Book_ID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price DECIMAL(10, 2),
    Stock INT
);

CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(100),
    Country VARCHAR(150)
);

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Book_ID INT,
    Order_Date DATE,
    Quantity INT,
    Total_Amount DECIMAL(10, 2),
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    CONSTRAINT fk_orders_book
        FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
);

-- Verify the tables after loading data.
SELECT * FROM Books LIMIT 10;
SELECT * FROM Customers LIMIT 10;
SELECT * FROM Orders LIMIT 10;
