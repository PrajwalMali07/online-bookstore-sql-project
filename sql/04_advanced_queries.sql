-- ============================================================
-- ADVANCED SQL QUERIES
-- ============================================================
USE bookstore;

-- 1. Retrieve the total number of books sold for each genre.
SELECT b.Genre,
       SUM(o.Quantity) AS total_books_sold
FROM Books AS b
JOIN Orders AS o
    ON b.Book_ID = o.Book_ID
GROUP BY b.Genre
ORDER BY total_books_sold DESC;

-- 2. Find the average price of books in the Fantasy genre.
SELECT AVG(Price) AS average_price
FROM Books
WHERE Genre = 'Fantasy';

-- 3. List customers who have placed at least 2 orders.
SELECT c.Customer_ID,
       c.Name,
       COUNT(o.Order_ID) AS order_count
FROM Customers AS c
JOIN Orders AS o
    ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Name
HAVING COUNT(o.Order_ID) >= 2
ORDER BY order_count DESC;

-- 4. Find the most frequently ordered book.
-- LIMIT 1 returns the single highest-frequency book.
SELECT b.Book_ID,
       b.Title,
       COUNT(o.Order_ID) AS order_count
FROM Orders AS o
JOIN Books AS b
    ON o.Book_ID = b.Book_ID
GROUP BY b.Book_ID, b.Title
ORDER BY order_count DESC
LIMIT 1;

-- 5. Show the top 3 most expensive books in the Fantasy genre.
SELECT *
FROM Books
WHERE Genre = 'Fantasy'
ORDER BY Price DESC
LIMIT 3;

-- 6. Retrieve the total quantity of books sold by each author.
SELECT b.Author,
       SUM(o.Quantity) AS total_quantity_sold
FROM Books AS b
JOIN Orders AS o
    ON b.Book_ID = o.Book_ID
GROUP BY b.Author
ORDER BY total_quantity_sold DESC;

-- 7. List cities where customers have an order above 30.
-- DISTINCT ensures each city appears once.
SELECT DISTINCT c.City
FROM Customers AS c
JOIN Orders AS o
    ON c.Customer_ID = o.Customer_ID
WHERE o.Total_Amount > 30
ORDER BY c.City;

-- 8. Find the customer who spent the most on orders.
-- LIMIT 1 returns the highest-spending customer.
SELECT c.Customer_ID,
       c.Name,
       SUM(o.Total_Amount) AS total_spent
FROM Customers AS c
JOIN Orders AS o
    ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Name
ORDER BY total_spent DESC
LIMIT 1;

-- 9. Calculate stock remaining after fulfilling all recorded orders.
SELECT b.Book_ID,
       b.Title,
       b.Stock,
       COALESCE(SUM(o.Quantity), 0) AS order_quantity,
       b.Stock - COALESCE(SUM(o.Quantity), 0) AS stock_remaining
FROM Books AS b
LEFT JOIN Orders AS o
    ON b.Book_ID = o.Book_ID
GROUP BY b.Book_ID, b.Title, b.Stock
ORDER BY b.Book_ID;
