CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(100)
);

INSERT INTO Customers (CustomerID, Name, Email)
VALUES
  (1, 'John Doe', 'johndoe@example.com'),
  (2, 'Jane Smith', 'janesmith@example.com'),
  (3, 'Robert Johnson', 'robertjohnson@example.com'),
  (4, 'Emily Brown', 'emilybrown@example.com'),
  (5, 'Michael Davis', 'michaeldavis@example.com'),
  (6, 'Sarah Wilson', 'sarahwilson@example.com'),
  (7, 'David Thompson', 'davidthompson@example.com'),
  (8, 'Jessica Lee', 'jessicalee@example.com'),
  (9, 'William Turner', 'williamturner@example.com'),
  (10, 'Olivia Martinez', 'oliviamartinez@example.com');



  CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  ProductName VARCHAR(50),
  OrderDate DATE,
  Quantity INT
);

INSERT INTO Orders (OrderID, CustomerID, ProductName, OrderDate, Quantity)
VALUES
  (1, 1, 'Product A', '2023-07-01', 5),
  (2, 2, 'Product B', '2023-07-02', 3),
  (3, 3, 'Product C', '2023-07-03', 2),
  (4, 4, 'Product A', '2023-07-04', 1),
  (5, 5, 'Product B', '2023-07-05', 4),
  (6, 6, 'Product C', '2023-07-06', 2),
  (7, 7, 'Product A', '2023-07-07', 3),
  (8, 8, 'Product B', '2023-07-08', 2),
  (9, 9, 'Product C', '2023-07-09', 5),
  (10, 10, 'Product A', '2023-07-10', 1);



  CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(50),
  Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, ProductName, Price)
VALUES
  (1, 'Product A', 10.99),
  (2, 'Product B', 8.99),
  (3, 'Product C', 5.99),
  (4, 'Product D', 12.99),
  (5, 'Product E', 7.99),
  (6, 'Product F', 6.99),
  (7, 'Product G', 9.99),
  (8, 'Product H', 11.99),
  (9, 'Product I', 14.99),
  (10, 'Product J', 4.99);


  --Task 1

  SELECT * FROM Customers;


  SELECT Name, Email
FROM Customers
WHERE Name LIKE 'J%';


SELECT Orders.OrderID, Products.ProductName, Orders.Quantity
FROM Orders
JOIN Products ON Orders.ProductName = Products.ProductName;


SELECT SUM(Quantity) AS TotalQuantity
FROM Orders;


SELECT DISTINCT Customers.Name
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID;


SELECT *
FROM Products
WHERE Price > 10.00;


SELECT Customers.Name, Orders.OrderDate
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderDate >= '2023-07-05';


SELECT AVG(Price) AS AveragePrice
FROM Products;


SELECT Customers.Name, SUM(Orders.Quantity) AS TotalQuantityOrdered
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.Name;


SELECT *
FROM Products
WHERE ProductName NOT IN (SELECT ProductName FROM Orders);




--Task 2

SELECT TOP 5 Customers.Name, SUM(Orders.Quantity) AS TotalQuantityOrdered
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.Name
ORDER BY TotalQuantityOrdered DESC;



SELECT ProductName, AVG(Price) AS AveragePrice
FROM Products
GROUP BY ProductName;


SELECT Customers.*
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.CustomerID IS NULL;


SELECT Orders.OrderID, Products.ProductName, Orders.Quantity
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN Products ON Orders.ProductName = Products.ProductName
WHERE Customers.Name LIKE 'M%';


SELECT SUM(Orders.Quantity * Products.Price) AS TotalRevenue
FROM Orders
JOIN Products ON Orders.ProductName = Products.ProductName;


SELECT Customers.Name, SUM(Orders.Quantity * Products.Price) AS TotalRevenue
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN Products ON Orders.ProductName = Products.ProductName
GROUP BY Customers.Name;


SELECT Customers.Name
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN Products ON Orders.ProductName = Products.ProductName
GROUP BY Customers.Name
HAVING COUNT(DISTINCT Products.ProductName) = (SELECT COUNT(DISTINCT ProductName) FROM Products);


SELECT DISTINCT c1.Name
FROM Customers c1
JOIN Orders o1 ON c1.CustomerID = o1.CustomerID
JOIN Orders o2 ON c1.CustomerID = o2.CustomerID
WHERE DATEDIFF(DAY, o1.OrderDate, o2.OrderDate) = 1;


SELECT TOP 3 Products.ProductName, AVG(Orders.Quantity) AS AverageQuantity
FROM Orders
JOIN Products ON Orders.ProductName = Products.ProductName
GROUP BY Products.ProductName
ORDER BY AverageQuantity DESC;


SELECT 
    (COUNT(CASE WHEN Orders.Quantity > avg_quantity THEN 1 END) * 100.0 / COUNT(*)) AS Percentage
FROM Orders
CROSS JOIN (SELECT AVG(Quantity) AS avg_quantity FROM Orders) AS avg_table;



--Task 3

SELECT 
    DATEPART(MONTH, OrderDate) AS Month,
    SUM(Quantity * Price) AS TotalRevenue
FROM Orders
JOIN Products ON Orders.ProductName = Products.ProductName
GROUP BY DATEPART(MONTH, OrderDate);


SELECT ProductName
FROM Orders
GROUP BY ProductName
HAVING COUNT(DISTINCT CustomerID) > (SELECT COUNT(*) * 0.5 FROM Customers);


SELECT TOP 5 Customers.Name, SUM(Orders.Quantity * Products.Price) AS TotalSpent
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN Products ON Orders.ProductName = Products.ProductName
GROUP BY Customers.CustomerID, Customers.Name
ORDER BY TotalSpent DESC;


SELECT CustomerID, OrderID, Quantity,
       SUM(Quantity) OVER (PARTITION BY CustomerID ORDER BY OrderID) AS RunningTotal
FROM Orders;


SELECT CustomerID, SUM(Quantity * Price) AS TotalRevenue
FROM Orders
JOIN Products ON Orders.ProductName = Products.ProductName
WHERE OrderDate >= DATEADD(DAY, -30, GETDATE())
GROUP BY CustomerID;


SELECT CustomerID, COUNT(DISTINCT Products.ProductName) AS NumCategories
FROM Orders
JOIN Products ON Orders.ProductName = Products.ProductName
GROUP BY CustomerID
HAVING COUNT(DISTINCT Products.ProductName) >= 2;


SELECT CustomerID, AVG(Quantity * Price) AS AvgRevenuePerOrder
FROM Orders
JOIN Products ON Orders.ProductName = Products.ProductName
GROUP BY CustomerID;


SELECT CustomerID
FROM Orders
GROUP BY CustomerID
HAVING COUNT(DISTINCT DATEPART(MONTH, OrderDate)) = 12;


SELECT ProductName
FROM Orders
WHERE CustomerID = 12345678910
GROUP BY ProductName
HAVING COUNT(*) >= 2;























