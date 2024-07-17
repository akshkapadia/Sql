create database Order_Stores_Data;
use Order_Stores_Data;

CREATE TABLE Orders_Table (
    OrderDate DATE,
    Region VARCHAR(255),
    Rep VARCHAR(255),
    Order_Item VARCHAR(255),
    Units INT,
    Unit_Cost DECIMAL(10, 2),
    Total_Price DECIMAL(10, 2),
    Order_Id INT PRIMARY KEY
);

CREATE TABLE Stores_Table (
    Store_Id INT,
    StoreType VARCHAR(255),
    Assortment VARCHAR(255),
    CompetitionDistance INT,
    Month INT,
    Year INT,
    PromoInterval VARCHAR(255)
);

INSERT INTO Orders_Table (OrderDate, Region, Rep, Order_Item, Units, Unit_Cost, Total_Price, Order_Id)
VALUES
  ('1-6-21', 'East', 'Aruna', 'Pencil', 95, 1.99, 189.05, 1),
  ('1-23-21', 'Central', 'Kivell', 'Eraser', 50, 19.99, 999.50, 2),
  ('2-9-21', 'Central', 'Ganesh', NULL, 36, 4.99, 179.64, 3),
  ('2-26-21', 'Central', 'Payal', NULL, 27, 19.99, 539.73, 4),
  ('3-15-21', 'West', 'Sorvino', NULL, 56, 2.99, 167.44, 5),
  ('4-1-21', 'East', 'Hitesh', 'Pencil', 60, 4.99, 299.40, 6),
  ('4-18-21', 'Central', 'Akshita', NULL, 75, 1.99, 149.25, 7),
  ('5-5-21', 'Central', 'Ruchika', 'Books', 90, 4.99, 449.10, 8),
  ('5-22-21', 'West', 'Surbhi', NULL, 32, 1.99, 63.68, 9),
  ('6-8-21', 'East', 'Jones', 'Suitcase', 60, 8.99, 539.40, 10);

  INSERT INTO Stores_Table (Store_Id, StoreType, Assortment, CompetitionDistance, Month, Year, PromoInterval)
VALUES
  (1, 'c', 32, 1270, 9, 2008, 'Jan'),
  (2, 'a', 31, 570, 11, 2007, 'Feb'),
  (3, 'a', 50, 14130, 12, 2006, 'Mar'),
  (4, 'c', 49, 620, 9, 2009, NULL),
  (5, 'a', 42, 29910, 4, 2015, 'May'),
  (6, 'a', 30, 310, 12, 2013, 'June'),
  (7, 'a', 27, 24000, 4, 2013, NULL),
  (8, 'a', 40, 7520, 10, 2014, 'Aug'),
  (9, 'a', 30, 2030, 8, 2000, NULL),
  (10, 'a', 41, 3160, 9, 2009, 'Oct');

  select * from Orders_Table;

  select * from Stores_Table;

  ALTER TABLE Orders_Table
ADD PRIMARY KEY (Order_Id);

ALTER TABLE Stores_Table
ADD Store_Names VARCHAR(255);

ALTER TABLE Stores_Table
DROP COLUMN Store_Names;

select * from Stores_Table;

UPDATE Stores_Table
SET Store_Names = 
    CASE
	    WHEN Store_Id = 1 THEN 'Car'
		WHEN Store_Id = 2 THEN 'Bikes'
		WHEN Store_Id = 3 THEN 'Hardware'
        WHEN Store_Id = 4 THEN 'Electrics'
        WHEN Store_Id = 5 THEN 'Fibers'
        WHEN Store_Id = 6 THEN 'Elastics'
        WHEN Store_Id = 7 THEN 'Books'
        WHEN Store_Id = 8 THEN 'Shoes'
        WHEN Store_Id = 9 THEN 'Clothes'
        WHEN Store_Id = 10 THEN 'Scraps'
        ELSE 'N/A'  -- Add a default value for records that don't match
    END
WHERE Store_Names IS NULL;

ALTER TABLE Stores_Table
ADD CONSTRAINT FK_Stores_Order FOREIGN KEY (Store_Id) REFERENCES Orders_Table(Order_Id);

ALTER TABLE Orders_Table
ADD Order_Name VARCHAR(255);

UPDATE Orders_Table
SET Order_Name =
    CASE
        WHEN Order_Item IS NULL AND Order_Id = 3 THEN 'Compass'
        WHEN Order_Item IS NULL AND Order_Id = 4 THEN 'Torch'
        WHEN Order_Item IS NULL AND Order_Id = 6 THEN 'Phone'
        WHEN Order_Item IS NULL AND Order_Id = 8 THEN 'Laptop'
        WHEN Order_Item IS NULL AND Order_Id = 9 THEN 'Box'
        ELSE 'N/A'  -- Add a default value for records that don't match
    END
WHERE Order_Item IS NULL;

UPDATE Stores_Table
SET PromoInterval = CASE
   
    WHEN Month = 4 THEN 'Apr'
    WHEN Month = 7 THEN 'Jul'
    WHEN Month = 9 THEN 'Sep'
    
    ELSE ''
END
WHERE PromoInterval IS NULL;

ALTER TABLE Stores_Table
RENAME COLUMN Assortment TO Store_Nos;

ALTER TABLE Orders_Table
RENAME COLUMN Order_Item TO Item_name;

ALTER TABLE Orders_Table
RENAME COLUMN Rep TO Customers_name;

SELECT *
FROM Orders_Table
ORDER BY "Unit_Cost"  DESC, Total_Price ASC;

SELECT Region, "Rep" AS Cus_Name, COUNT(*) AS Num_Customers
FROM Orders_Table
GROUP BY Region, Cus_Name
ORDER BY Region, Num_Customers DESC;

SELECT SUM("Total_Price") AS TotalPriceSum, SUM("Unit_Cost") AS UnitCostSum
FROM Orders_Table;

SELECT OT.OrderDate, OT."Unit_Cost", ST.StoreType, ST.Year
FROM Orders_Table OT
JOIN Stores_Table ST ON OT.Order_Id = ST.Store_Id;

SELECT Order_Item, Region
FROM Orders_Table
WHERE Order_Id IN (4, 5, 6, 9);

SELECT Year
FROM Stores_Table
WHERE CompetitionDistance IN (29910, 310, 3160);

SELECT Order_Item
FROM Orders_Table
WHERE Total_Price > 200 AND Total_Price < 400;

ALTER TABLE Stores_Table
RENAME COLUMN CompetitionDistance TO CD;
SELECT SUM(CompetitionDistance) AS Total_CD
FROM Stores_Table

SELECT
    COUNT(StoreType) AS TotalStoreTypeCount,
    COUNT(CompetitionDistance) AS TotalCompetitionDistanceCount
FROM Stores_Table

SELECT *
FROM Orders_Table
CROSS JOIN Stores_Table;

DROP TABLE Orders_Table;
DROP TABLE Stores_Table;




