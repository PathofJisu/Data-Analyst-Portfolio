SELECT * FROM vgsales;
-- Name, Year, Platform, Genre, Publisher, Global_Sales, NA_Sales, EU_Sales, JP_Sales, Other_Sales

-- Checking popular factors (Game, Genre, Platform, Company) in the world  -- 

-- Top 10 sold Games in the world. 
SELECT Name, Global_Sales 
From vgsales
Order By Global_Sales desc
Limit 10;

-- Top 10 platform which sold Games in the world. 
SELECT Platform, COUNT(Global_Sales) As Sales
From vgsales
Group By Platform
Order By Sales desc
Limit 10;

-- Top 10 Genre which sold Games in the world. 
SELECT Genre, COUNT(Global_Sales) As Sales
From vgsales
Group By Genre
Order By Sales desc
Limit 10;

-- Top 10 Companies which sold Games in the world. 
SELECT Publisher, COUNT(Global_Sales) As Sales
From vgsales
Group By Publisher
Order By Sales desc
Limit 10;

-- Checking trends for the factors (Game, Genre, release(year)) --

-- Release Trends
SELECT Year, COUNT(Year) As Release_count
From vgsales
Group By Year
Order By Year desc;

-- Genre Trends 
CREATE TABLE BestGenre AS 
	(
    SELECT Year, Genre, count(Genre) as Total
    FROM vgsales
    Group By Year, Genre
	Order By Year desc
    );
    
SELECT * FROM BestGenre;

SELECT Year, max(Total) AS Max_Total
FROM BestGenre
Group By Year
Order By Year desc;

SELECT BestGenre.Year, BestGenre.Genre, BestGenre.Total
FROM (
	SELECT Year, MAX(Total) AS Max_Total
    FROM BestGenre
	Group By Year
	Order By Year desc
    ) Table1
INNER JOIN BestGenre 
ON Table1.Year = BestGenre.Year AND Table1.Max_Total = BestGenre.Total;
    
-- Countries that bought the most games / Game Trends in the World
SELECT Year, SUM(Global_Sales) AS SaleTotal
FROM vgsales
GROUP BY Year
ORDER BY Year desc;

-- Countries that bought the most games / Detailed Game Trends in the World
CREATE TABLE GameTrends AS
(
SELECT Year, ROUND(SUM(NA_Sales),2) AS NorthAmerica, ROUND(SUM(EU_Sales),2) AS Europe, ROUND(SUM(JP_Sales),2) AS Japan, ROUND(SUM(Other_Sales),2) AS Others
FROM vgsales
GROUP BY Year
ORDER BY Year desc
);

SELECT * FROM GameTrends;

CREATE TABLE Table0 AS(
SELECT Year, NorthAmerica AS SalesAmount, 'NorthAmerica' AS Continents FROM GameTrends
UNION ALL
SELECT Year, Europe AS SalesAmount, 'Europe' AS Continents FROM GameTrends
UNION ALL
SELECT Year, Japan AS SalesAmount, 'Japan' AS Continents FROM GameTrends
UNION ALL
SELECT Year, Others AS SalesAmount, 'Others' AS Continents FROM GameTrends
);

CREATE TABLE TABLE_A AS (
SELECT Year, SalesAmount, Continents FROM Table0
ORDER BY Year desc
);

CREATE TABLE TABLE_B AS(
SELECT Year, MAX(SalesAmount) AS BestSale FROM Table0
Group By Year
Order By Year desc);


SELECT TABLE_B.*,TABLE_A.Continents 
FROM TABLE_B
INNER JOIN TABLE_A
ON TABLE_A.Year = TABLE_B.Year AND TABLE_A.SalesAmount = TABLE_B.BestSale;
 
 /*
SELECT TABLE_B.*, TABLE_A.Continents  
FROM TABLE_A, TABLE_B
WHERE TABLE_A.Year = TABLE_B.Year AND TABLE_A.SalesAmount = TABLE_B.BestSale;
*/

-- Game Market Share -- 

-- TOP 10 company that sold the most games
SELECT Publisher, ROUND(SUM(Global_Sales),2) As Sales, ROUND(SUM(NA_Sales),2) AS NorthAmerica, ROUND(SUM(EU_Sales),2) AS Europe, ROUND(SUM(JP_Sales),2) AS Japan, ROUND(SUM(Other_Sales),2) AS Others 
From vgsales
Group By Publisher 
ORDER BY Sales DESC
LIMIT 10;

-- The company that sold the most games on each continent --

-- NorthAmerica
SELECT Publisher, ROUND(SUM(NA_Sales),2) AS Sales
From vgsales
Group By Publisher 
ORDER BY Sales DESC
Limit 10;

-- Europe
SELECT Publisher, ROUND(SUM(EU_Sales),2) AS Sales
From vgsales
Group By Publisher 
ORDER BY Sales DESC
Limit 10;

-- Japan
SELECT Publisher, ROUND(SUM(JP_Sales),2) AS Sales
From vgsales
Group By Publisher 
ORDER BY Sales DESC
Limit 10;

-- Others 
SELECT Publisher, ROUND(SUM(Other_Sales),2) AS Sales
From vgsales
Group By Publisher 
ORDER BY Sales DESC
Limit 10;



