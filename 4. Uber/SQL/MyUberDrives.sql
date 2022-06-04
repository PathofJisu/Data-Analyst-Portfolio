-- The Frequency -- 
-- Frequency By Category
SELECT 'Business' as Name, COUNT(CASE WHEN category LIKE 'Business' THEN 1 END) AS Total From myuberdrives
UNION ALL 
SELECT 'Personal' as Name, COUNT(CASE WHEN category LIKE 'Personal' THEN 1 END) AS Total From myuberdrives
UNION ALL 
SELECT 'Others' as Name, COUNT(CASE WHEN category LIKE '' THEN 1 END) AS Total From myuberdrives;

-- Frequency By Purpose
SELECT 'Others' as Name, COUNT(CASE WHEN purpose LIKE '' THEN 1 END) AS Total From myuberdrives
UNION ALL
SELECT 'Meeting' as Name, COUNT(CASE WHEN purpose LIKE 'Meeting' THEN 1 END) AS Total From myuberdrives
UNION ALL
SELECT 'Meal/Entertain' as Name, COUNT(CASE WHEN purpose LIKE 'Meal/Entertain' THEN 1 END) AS Total From myuberdrives
UNION ALL 
SELECT 'Errand/Supplies' as Name, COUNT(CASE WHEN purpose LIKE 'Errand/Supplies' THEN 1 END) AS Total From myuberdrives
UNION ALL
SELECT 'Customer Visit' as Name, COUNT(CASE WHEN purpose LIKE 'Customer Visit' THEN 1 END) AS Total From myuberdrives
UNION ALL
SELECT 'Temporary Site' as Name, COUNT(CASE WHEN purpose LIKE 'Temporary Site' THEN 1 END) AS Total From myuberdrives
UNION ALL
SELECT 'Between Offices' as Name, COUNT(CASE WHEN purpose LIKE 'Between Offices' THEN 1 END) AS Total From myuberdrives
UNION ALL
SELECT 'Moving' as Name, COUNT(CASE WHEN purpose LIKE 'Moving' THEN 1 END) AS Total From myuberdrives
UNION ALL
SELECT 'Airport/Travel' as Name, COUNT(CASE WHEN purpose LIKE 'Airport/Travel' THEN 1 END) AS Total From myuberdrives
UNION ALL
SELECT 'Charity ($)' as Name, COUNT(CASE WHEN purpose LIKE 'Charity ($)' THEN 1 END) AS Total From myuberdrives
UNION ALL
SELECT 'Commute' as Name, COUNT(CASE WHEN purpose LIKE 'Commute' THEN 1 END) AS Total From myuberdrives;

-- Trend of Users -- 
-- Frequency Of Use Per Month
SELECT MONTH(STR_TO_DATE(start_date, '%c/%e/%Y %T')) AS Month, COUNT(MONTH(STR_TO_DATE(start_date, '%c/%e/%Y %T'))) AS NumberofUsage 
FROM myuberdrives
GROUP BY MONTH(STR_TO_DATE(start_date, '%c/%e/%Y %T'));

-- Average Number Of Miles Used Per Month 
SELECT MONTH(STR_TO_DATE(start_date, '%c/%e/%Y %T')) AS Months, ROUND(AVG(miles),2) AS AverageMiles
FROM myuberdrives
GROUP BY MONTH(STR_TO_DATE(start_date, '%c/%e/%Y %T'));

-- Frequency Of Use By Hour
SELECT HOUR(STR_TO_DATE(start_date, '%c/%e/%Y %T')) AS Hours, COUNT(HOUR(STR_TO_DATE(start_date, '%c/%e/%Y %T'))) AS NumberofUsage 
FROM myuberdrives
GROUP BY HOUR(STR_TO_DATE(start_date, '%c/%e/%Y %T'))
ORDER BY HOUR(STR_TO_DATE(start_date, '%c/%e/%Y %T'));

-- The Average Number Of Users In Hours
SELECT HOUR(STR_TO_DATE(start_date, '%c/%e/%Y %T')) AS Hours, ROUND(AVG(miles),2) AS AverageMiles 
FROM myuberdrives
GROUP BY HOUR(STR_TO_DATE(start_date, '%c/%e/%Y %T'))
ORDER BY HOUR(STR_TO_DATE(start_date, '%c/%e/%Y %T'));

-- Average Number Of Miles Used By Category
SELECT Category, ROUND(AVG(miles),2) AS AverageMiles 
FROM myuberdrives
GROUP BY Category;

-- Average Number Of Miles Used By Purpose
SELECT Purpose, ROUND(AVG(miles),2) AS AverageMiles 
FROM myuberdrives
GROUP BY Purpose;




