SELECT * FROM `Uber&Lyft`.rideshare_kaggle_1;

-- The Frequency -- 
-- Frequency of Uber & Lyft use
SELECT 'Uber' as Name, COUNT(CASE WHEN cab_type LIKE 'Uber' THEN 1 END) AS Total From rideshare_kaggle_1
UNION ALL
SELECT 'Lyft' as Name, COUNT(CASE WHEN cab_type LIKE 'Lyft' THEN 1 END) AS Total From rideshare_kaggle_1;

-- Frequency of use according to weather
WITH TABLE_A AS (
SELECT ' Clear ' as Weather, COUNT(CASE WHEN short_summary LIKE ' Clear ' THEN 1 END) AS Total From rideshare_kaggle_1
UNION ALL
SELECT ' Drizzle ' as Weather, COUNT(CASE WHEN short_summary LIKE ' Drizzle ' THEN 1 END) AS Total From rideshare_kaggle_1
UNION ALL
SELECT ' Foggy ' as Weather, COUNT(CASE WHEN short_summary LIKE ' Foggy ' THEN 1 END) AS Total From rideshare_kaggle_1
UNION ALL
SELECT ' Light Rain ' as Weather, COUNT(CASE WHEN short_summary LIKE ' Light Rain ' THEN 1 END) AS Total From rideshare_kaggle_1
UNION ALL
SELECT ' Mostly Cloudy ' as Weather, COUNT(CASE WHEN short_summary LIKE ' Mostly Cloudy ' THEN 1 END) AS Total From rideshare_kaggle_1
UNION ALL
SELECT ' Overcast ' as Weather, COUNT(CASE WHEN short_summary LIKE ' Overcast ' THEN 1 END) AS Total From rideshare_kaggle_1
UNION ALL
SELECT ' Partly Cloudy ' as Weather, COUNT(CASE WHEN short_summary LIKE ' Partly Cloudy ' THEN 1 END) AS Total From rideshare_kaggle_1
UNION ALL
SELECT ' Possible Drizzle ' as Weather, COUNT(CASE WHEN short_summary LIKE ' Possible Drizzle ' THEN 1 END) AS Total From rideshare_kaggle_1
UNION ALL
SELECT ' Rain ' as Weather, COUNT(CASE WHEN short_summary LIKE ' Rain ' THEN 1 END) AS Total From rideshare_kaggle_1
)
SELECT * FROM TABLE_A
ORDER BY Total desc;

-- Uber vs Lyft -- 
-- Uber vs Lyft Total Revenue Comparison
SELECT cab_type, sum(price) as Revenue
FROM rideshare_kaggle_1
GROUP BY cab_type;

-- Total number of used miles of Uber and Lyft
SELECT cab_type, Sum(distance) as Total_miles
FROM rideshare_kaggle_1
GROUP BY cab_type
ORDER BY Total_miles DESC;

-- Trend -- 
-- Frequency of Use Per Hour
SELECT hour, COUNT(hour) as Total
FROM rideshare_kaggle_1
GROUP BY hour
ORDER BY Total DESC;

-- Sales Price Per Hour
SELECT hour, sum(price) as SalePrices
FROM rideshare_kaggle_1
GROUP BY hour
ORDER BY SalePrices DESC;

-- Average number of miles used per Hour
SELECT hour, ROUND(AVG(distance),3) as AverageMiles
FROM rideshare_kaggle_1
GROUP BY hour
ORDER BY AverageMiles DESC;

-- Frequency of use of apps (Uber or Lyft) per Hour
SELECT hour, cab_type, COUNT(cab_type) AS total 
FROM rideshare_kaggle_1
GROUP BY hour, cab_type
ORDER BY hour;

-- Most used apps by time
WITH TABLE_B AS (
SELECT hour, cab_type, COUNT(cab_type) AS total 
FROM rideshare_kaggle_1
GROUP BY hour, cab_type
ORDER BY hour)
,
TABLE_C AS (
(SELECT * FROM TABLE_B WHERE hour = 0 ORDER BY total desc LIMIT 1)
UNION ALL
(SELECT * FROM TABLE_B WHERE hour = 1 ORDER BY total desc LIMIT 1)
UNION ALL
(SELECT * FROM TABLE_B WHERE hour = 2 ORDER BY total desc LIMIT 1)
UNION ALL
(SELECT * FROM TABLE_B WHERE hour = 3 ORDER BY total desc LIMIT 1)
UNION ALL
(SELECT * FROM TABLE_B WHERE hour = 4 ORDER BY total desc LIMIT 1)
UNION ALL
(SELECT * FROM TABLE_B WHERE hour = 5 ORDER BY total desc LIMIT 1)
UNION ALL
(SELECT * FROM TABLE_B WHERE hour = 6 ORDER BY total desc LIMIT 1)
UNION ALL
(SELECT * FROM TABLE_B WHERE hour = 7 ORDER BY total desc LIMIT 1)
UNION ALL
(SELECT * FROM TABLE_B WHERE hour = 8 ORDER BY total desc LIMIT 1)
UNION ALL
(SELECT * FROM TABLE_B WHERE hour = 9 ORDER BY total desc LIMIT 1)
UNION ALL
(SELECT * FROM TABLE_B WHERE hour = 10 ORDER BY total desc LIMIT 1)
UNION ALL
(SELECT * FROM TABLE_B WHERE hour = 11 ORDER BY total desc LIMIT 1)
UNION ALL
(SELECT * FROM TABLE_B WHERE hour = 12 ORDER BY total desc LIMIT 1)
UNION ALL
(SELECT * FROM TABLE_B WHERE hour = 13 ORDER BY total desc LIMIT 1)
UNION ALL
(SELECT * FROM TABLE_B WHERE hour = 14 ORDER BY total desc LIMIT 1)
UNION ALL
(SELECT * FROM TABLE_B WHERE hour = 15 ORDER BY total desc LIMIT 1)
UNION ALL
(SELECT * FROM TABLE_B WHERE hour = 16 ORDER BY total desc LIMIT 1)
UNION ALL
(SELECT * FROM TABLE_B WHERE hour = 17 ORDER BY total desc LIMIT 1)
UNION ALL
(SELECT * FROM TABLE_B WHERE hour = 18 ORDER BY total desc LIMIT 1)
UNION ALL
(SELECT * FROM TABLE_B WHERE hour = 19 ORDER BY total desc LIMIT 1)
UNION ALL
(SELECT * FROM TABLE_B WHERE hour = 20 ORDER BY total desc LIMIT 1)
UNION ALL
(SELECT * FROM TABLE_B WHERE hour = 21 ORDER BY total desc LIMIT 1)
UNION ALL
(SELECT * FROM TABLE_B WHERE hour = 22 ORDER BY total desc LIMIT 1)
UNION ALL
(SELECT * FROM TABLE_B WHERE hour = 23 ORDER BY total desc LIMIT 1)
)

SELECT * FROM TABLE_C
;

-- Weather -- 
-- Sales price according to weather
SELECT short_summary as Weather, COUNT(price) as SalePrices
FROM rideshare_kaggle_1
GROUP BY Weather
ORDER BY SalePrices DESC;

-- Average number of miles used depending on weather
SELECT short_summary as Weather, ROUND(AVG(distance),4) as AverageMiles
FROM rideshare_kaggle_1
GROUP BY Weather
ORDER BY AverageMiles DESC;

-- Frequency of application (Uber or Lyft) usage according to the weather
SELECT short_summary as Weather, cab_type, COUNT(cab_type) AS total 
FROM rideshare_kaggle_1
GROUP BY Weather, cab_type
ORDER BY Weather;
SELECT * FROM rideshare_kaggle_1 WHERE short_summary = ' Clear ' ORDER BY total desc LIMIT 1;

-- Most used apps by weather
WITH TABLE_D AS ( 
SELECT short_summary as Weather, cab_type, COUNT(cab_type) AS total 
FROM rideshare_kaggle_1
GROUP BY Weather, cab_type
ORDER BY Weather)
,

TABLE_E AS(
(SELECT * FROM TABLE_D WHERE Weather = ' Clear ' ORDER BY total desc LIMIT 1)
UNION ALL
(SELECT * FROM TABLE_D WHERE Weather = ' Drizzle ' ORDER BY total desc LIMIT 1)
UNION ALL
(SELECT * FROM TABLE_D WHERE Weather = ' Foggy ' ORDER BY total desc LIMIT 1)
UNION ALL
(SELECT * FROM TABLE_D WHERE Weather = ' Light Rain ' ORDER BY total desc LIMIT 1)
UNION ALL
(SELECT * FROM TABLE_D WHERE Weather = ' Mostly Cloudy ' ORDER BY total desc LIMIT 1)
UNION ALL
(SELECT * FROM TABLE_D WHERE Weather = ' Overcast ' ORDER BY total desc LIMIT 1)
UNION ALL
(SELECT * FROM TABLE_D WHERE Weather = ' Partly Cloudy ' ORDER BY total desc LIMIT 1)
UNION ALL
(SELECT * FROM TABLE_D WHERE Weather = ' Possible Drizzle ' ORDER BY total desc LIMIT 1)
)
SELECT * FROM TABLE_E;

-- Cars’ service types -- 
-- Frequency of use according to vehicle service type
SELECT name as ServiceType, COUNT(name) as Total
FROM rideshare_kaggle_1
GROUP BY ServiceType
ORDER BY Total DESC;

-- Sales price by vehicle service type
SELECT name as ServiceType, COUNT(name) as Total
FROM rideshare_kaggle_1
GROUP BY ServiceType
ORDER BY Total DESC;

-- Average number of miles used by vehicle service type
SELECT name as ServiceType, ROUND(AVG(distance),5) as AverageMiles
FROM rideshare_kaggle_1
GROUP BY ServiceType
ORDER BY AverageMiles DESC;

-- Frequency of application (Uber or Lyft) usage for vehicle service type
SELECT name as ServiceType, cab_type, COUNT(cab_type) AS total 
FROM rideshare_kaggle_1
GROUP BY ServiceType, cab_type
ORDER BY Total DESC;

-- Location -- 
-- Locations with the most destinations
SELECT destination, COUNT(destination) as Total
FROM rideshare_kaggle_1
GROUP BY destination
ORDER BY Total DESC;

-- Locations with the most destinations in Uber App
SELECT cab_type, destination, COUNT(destination) as Total
FROM rideshare_kaggle_1
WHERE cab_type = 'Uber'
GROUP BY destination, cab_type
ORDER BY Total DESC;

-- Locations with the most destinations in Lyft App
SELECT cab_type, destination, COUNT(destination) as Total
FROM rideshare_kaggle_1
WHERE cab_type = 'Lyft'
GROUP BY destination, cab_type
ORDER BY Total DESC;