SELECT * FROM StoreData;

-- Change Name to remove space in column name
CREATE TABLE StoreData AS (SELECT * FROM superstore);

ALTER TABLE StoreData
RENAME COLUMN `Order ID` TO Order_ID;

ALTER TABLE StoreData
RENAME COLUMN `Order Date` TO Order_Date;

ALTER TABLE StoreData
RENAME COLUMN `Ship Date` TO Ship_Date;

ALTER TABLE StoreData
RENAME COLUMN `Ship Mode` TO Ship_Mode;

ALTER TABLE StoreData
RENAME COLUMN `Customer ID` TO Customer_ID;

ALTER TABLE StoreData
RENAME COLUMN `Customer Name` TO Customer_Name;

ALTER TABLE StoreData
RENAME COLUMN `Postal Code` TO Postal_Code;

ALTER TABLE StoreData
RENAME COLUMN `Product ID` TO Product_ID;

ALTER TABLE StoreData
RENAME COLUMN `Product Name` TO Product_Name;

ALTER TABLE StoreData
RENAME COLUMN `Sub-Category` TO Sub_Category;
-- Change Date type dd/mm/yyy to yyyy-mm-dd

-- SET SQL_SAFE_UPDATES = 0;
-- Error solution: MySql session has the safe-updates option set 

UPDATE StoreData   
SET Order_Date = DATE_FORMAT( STR_TO_DATE (Order_Date , "%d/%m/%Y" ) , "%Y-%m-%d" );

UPDATE StoreData   
SET Ship_Date = DATE_FORMAT( STR_TO_DATE (Ship_Date , "%d/%m/%Y" ) , "%Y-%m-%d" );

SELECT Order_Date FROM StoreData
WHERE Order_Date BETWEEN '2016-01-01' AND '2017-01-01'
ORDER BY Order_Date ASC;


