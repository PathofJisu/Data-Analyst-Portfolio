SELECT * FROM myuberdrives;
SHOW WARNINGS;

-- Delete end of the row "Tatals"
DELETE FROM myuberdrives WHERE start_date = 'Totals';

-- Change Name to remove asterisk sign in column name
ALTER TABLE myuberdrives
RENAME COLUMN `start_date*` TO start_date;

ALTER TABLE myuberdrives
RENAME COLUMN `end_date*` TO end_date;

ALTER TABLE myuberdrives
RENAME COLUMN `category*` TO category;

ALTER TABLE myuberdrives
RENAME COLUMN `start*` TO start;

ALTER TABLE myuberdrives
RENAME COLUMN `stop*` TO stop;

ALTER TABLE myuberdrives
RENAME COLUMN `miles*` TO miles;

ALTER TABLE myuberdrives
RENAME COLUMN `purpose*` TO purpose;

-- Change Date type 'string' to 'date'
-- SET SQL_SAFE_UPDATES = 0;
SHOW warnings;
UPDATE myuberdrives
SET start_date = STR_TO_DATE(start_date, '%c/%e/%Y %T');