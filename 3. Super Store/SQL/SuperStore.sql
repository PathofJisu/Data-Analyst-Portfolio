SELECT * FROM StoreData; 

-- Checking Market Share in The United States -- 
-- The State Sold The Most Items
SELECT State, ROUND(SUM(Sales),2) AS Total_Sales
FROM StoreData
GROUP BY State
ORDER BY Total_Sales desc;

-- The City Sold The Most Among The Selected States
SELECT State, City, ROUND(SUM(Sales),2) AS Total_Sales
FROM StoreData
WHERE State ='California'
GROUP BY City
ORDER BY Total_Sales desc;

-- Top 10 Product Sold The Most
SELECT Product_Name, ROUND(SUM(Sales),2) AS Total_Sales
FROM StoreData
GROUP BY Product_Name
ORDER BY Total_Sales desc
LIMIT 10;

-- The Category Sold The Most
SELECT Category, ROUND(SUM(Sales),2) AS Total_Sales
FROM StoreData
GROUP BY Category
ORDER BY Total_Sales desc;

-- The Sub-Category Sold The Most For Each Category
SELECT Category, Sub_Category, ROUND(SUM(Sales),2) AS Total_Sales
FROM StoreData
GROUP BY Category, Sub_Category
ORDER BY Category, Total_Sales desc;

-- The Shipmode Sold The Most
SELECT Ship_Mode, ROUND(SUM(Sales),2) AS Total_Sales
FROM StoreData
GROUP BY Ship_Mode
ORDER BY Total_Sales desc;

-- SuperStore Trends -- 
-- The year in which goods were sold the most
SELECT YEAR(Order_Date) AS Order_Year, ROUND(SUM(Sales),2) AS Total_Sales
FROM StoreData
GROUP BY Order_Year
ORDER BY Total_Sales desc;

-- TOP 3 products sold the most every year
CREATE TABLE Table_A AS
(
SELECT YEAR(Order_Date) AS Order_Year, Product_Name, ROUND(SUM(Sales),2) AS Total_Sales
FROM StoreData
GROUP BY Order_Year, Product_Name
ORDER BY Order_Year, Total_Sales desc 
);

(SELECT * FROM Table_A WHERE Order_Year = 2018 LIMIT 3)
UNION ALL 
(SELECT * FROM Table_A WHERE Order_Year = 2017 LIMIT 3)
UNION ALL 
(SELECT * FROM Table_A WHERE Order_Year = 2016 LIMIT 3)
UNION ALL 
(SELECT * FROM Table_A WHERE Order_Year = 2015 LIMIT 3);

-- Category Sold The Most Every Year 
SELECT YEAR(Order_Date) AS Order_Year, Category, ROUND(SUM(Sales),2) AS Total_Sales
FROM StoreData
GROUP BY Order_Year, Category
ORDER BY Order_Year, Total_Sales desc;

-- Top 3 Sub-Categories In Each Category Sold The Most Every Year
CREATE TABLE Table_B AS
(
SELECT YEAR(Order_Date) AS Order_Year, Category, Sub_Category, ROUND(SUM(Sales),2) AS Total_Sales
FROM StoreData
GROUP BY Order_Year, Category, Sub_Category
ORDER BY Order_Year, Category, Total_Sales desc
);

CREATE TABLE TABLE_B1 AS(
(SELECT * FROM Table_B WHERE Order_Year = 2018 AND Category = 'Furniture' LIMIT 3)
UNION ALL 
(SELECT * FROM Table_B WHERE Order_Year = 2018 AND Category = 'Office Supplies' LIMIT 3)
UNION ALL 
(SELECT * FROM Table_B WHERE Order_Year = 2018 AND Category = 'Technology' LIMIT 3)
UNION ALL 
(SELECT * FROM Table_B WHERE Order_Year = 2017 AND Category = 'Furniture' LIMIT 3)
UNION ALL 
(SELECT * FROM Table_B WHERE Order_Year = 2017 AND Category = 'Office Supplies' LIMIT 3)
UNION ALL 
(SELECT * FROM Table_B WHERE Order_Year = 2017 AND Category = 'Technology' LIMIT 3)
UNION ALL 
(SELECT * FROM Table_B WHERE Order_Year = 2016 AND Category = 'Furniture' LIMIT 3)
UNION ALL 
(SELECT * FROM Table_B WHERE Order_Year = 2016 AND Category = 'Office Supplies' LIMIT 3)
UNION ALL 
(SELECT * FROM Table_B WHERE Order_Year = 2016 AND Category = 'Technology' LIMIT 3)
UNION ALL 
(SELECT * FROM Table_B WHERE Order_Year = 2015 AND Category = 'Furniture' LIMIT 3)
UNION ALL 
(SELECT * FROM Table_B WHERE Order_Year = 2015 AND Category = 'Office Supplies' LIMIT 3)
UNION ALL 
(SELECT * FROM Table_B WHERE Order_Year = 2015 AND Category = 'Technology' LIMIT 3)
);

SELECT * FROM Table_B1;

-- The City & State That Sold The Most Product: Checking Target State and City --
-- The Category Sold The Most In The Most Sold State
SELECT State, Category, ROUND(SUM(Sales),2) AS Total_Sales
FROM StoreData
WHERE State ='California'
GROUP BY Category
ORDER BY Total_Sales desc;

-- The Category Sold The Most In The Most Sold State and City 
SELECT State, City, Category, ROUND(SUM(Sales),2) AS Total_Sales
FROM StoreData
WHERE State ='California' AND City = 'Los Angeles'
GROUP BY Category
ORDER BY Total_Sales desc;

-- The Sub-Category Sold The Most In The Most Sold State
SELECT State, Category, Sub_Category, ROUND(SUM(Sales),2) AS Total_Sales
FROM StoreData
WHERE State ='California'
GROUP BY Category, Sub_Category
ORDER BY Total_Sales desc;

-- The Sub-Category Sold The Most In The Most Sold State and City 
SELECT State, City, Category, Sub_Category, ROUND(SUM(Sales),2) AS Total_Sales
FROM StoreData
WHERE State ='California' AND City = 'Los Angeles'
GROUP BY Category, Sub_Category
ORDER BY Total_Sales desc;