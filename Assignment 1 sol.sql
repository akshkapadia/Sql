create database Brands;
create database Products;

use Brands;

CREATE TABLE ITEMS_Table (
  Item_Id INT PRIMARY KEY,
  item_description VARCHAR(255) NOT NULL,
  vendor_nos INT NOT NULL,
  vendor_name VARCHAR(255) NOT NULL,
  bottle_size INT NOT NULL,
  bottle_price DECIMAL(10,2) NOT NULL
);

use Products;

CREATE TABLE PRODUCT_Table (
    Product_Id INT PRIMARY KEY,
    Country VARCHAR(255) NOT NULL,
    Product VARCHAR(255) NOT NULL,
    Units_Sold DECIMAL(10,2) NOT NULL,
    Manufacturing_Price DECIMAL(10,2) NOT NULL,
    Sale_Price DECIMAL(10,2) NOT NULL,
    Gross_Sales DECIMAL(10,2) NOT NULL,
    Sales DECIMAL(10,2) NOT NULL,
    COGS DECIMAL(10,2) NOT NULL,
    Profit DECIMAL(10,2) NOT NULL,
    Date DATE NOT NULL,
    Month_Number INT NOT NULL,
    Month_Name VARCHAR(255) NOT NULL,
    Year INT NOT NULL
);

use Brands;

INSERT INTO ITEMS_Table (Item_Id, item_description, vendor_nos, vendor_name, bottle_size, bottle_price)
VALUES
(1, 'Travis Hasse Apple Pie', 305, 'Mhw Ltd', 750, 9.77),
(2, 'D''aristi Xtabentun', 391, 'Anchor Distilling (preiss Imports)', 750, 14.12),
(3, 'Hiram Walker Peach Brandy', 370, 'Pernod Ricard Usa/austin Nichols', 1000, 6.50),
(4, 'Oak Cross Whisky', 305, 'Mhw Ltd', 750, 25.33),
(5, 'Uv Red(cherry) Vodka', 380, 'Phillips Beverage Company', 200, 1.97),
(6, 'Heaven Hill Old Style White Label', 259, 'Heaven Hill Distilleries Inc.', 750, 6.37),
(7, 'Hyde Herbal Liqueur', 194, 'Fire Tail Brands Llc', 750, 5.06),
(8, 'Dupont Calvados Fine Reserve', 403, 'Robert Kacher Selections', 750, 23.61);

use Products;

INSERT INTO PRODUCT_Table (Product_Id, Country, Product, Units_Sold, Manufacturing_Price, Sale_Price, Gross_Sales, Sales, COGS, Profit, Date, Month_Number, Month_Name, Year)
VALUES
(1, 'Canada', 'Carretera', 1618.50, 3.00, 20.00, 32370.00, 32370.00, 16185.00, 16185.00, '2014-01-01', 1, 'January', 2014),
(2, 'Germany', 'Carretera', 1321.00, 3.00, 20.00, 26420.00, 26420.00, 13210.00, 13210.00, '2014-01-01', 1, 'January', 2015),
(3, 'France', 'Carretera', 2178.00, 3.00, 15.00, 32670.00, 32670.00, 21780.00, 10890.00, '2014-06-01', 6, 'June', 2016),
(4, 'Germany', 'Carretera', 888.00, 3.00, 15.00, 13320.00, 13320.00, 8880.00, 4440.00, '2014-06-01', 6, 'June', 2017),
(5, 'Mexico', 'Carretera', 2470.00, 3.00, 15.00, 37050.00, 37050.00, 24700.00, 12350.00, '2014-06-01', 6, 'June', 2018),
(6, 'Germany', 'Carretera', 1513.00, 3.00, 350.00, 529550.00, 529550.00, 393380.00, 136170.00, '2014-12-01', 12, 'December', 2019),
(7, 'Germany', 'Montana', 921.00, 5.00, 15.00, 13815.00, 13815.00, 9210.00, 4605.00, '2014-03-01', 3, 'March', 2020),
(8, 'Canada', 'Montana', 2518.00, 5.00, 12.00, 30216.00, 30216.00, 7554.00, 22662.00, '2014-06-01', 6, 'June', 2021);

DELETE FROM PRODUCT_Table WHERE Units_Sold IN (1618.5, 888, 2470);


drop table PRODUCT_Table;

use Brands;

drop table ITEMS_Table;

SELECT SUM(Sale_Price) AS Total_Sale_Price, SUM(Gross_Sales) AS Gross_Sales
FROM PRODUCT_Table;

SELECT Year, SUM(Gross_Sales) AS Total_Sales
FROM PRODUCT_Table
GROUP BY Year
ORDER BY Total_Sales DESC

SELECT * FROM PRODUCT_Table WHERE Gross_Sales = 37050.00;

SELECT DISTINCT Country
FROM PRODUCT_Table
WHERE Profit BETWEEN 4605 AND 22662

SELECT Product_Id
FROM PRODUCT_Table
WHERE Sales = 24700.00;

use Brands;

SELECT item_description
FROM ITEMS_Table
WHERE bottle_size = 750;

SELECT vendor_name
FROM ITEMS_Table
WHERE vendor_nos IN (305, 380, 391)

SELECT SUM(bottle_price) AS total_bottle_price
FROM ITEMS_Table;

ALTER TABLE ITEMS_Table
ADD CONSTRAINT PK_Items
PRIMARY KEY (Item_Id);

SELECT item_id
FROM ITEMS_Table
WHERE bottle_price = 5.06;






