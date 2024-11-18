SELECT * from generate_series(DATE '2024-11-01', DATE '2024-11-30', INTERVAL '1 day');


-- date dimension
SELECT
	*
from
	generate_series(DATE '2024-11-01',
	DATE '2024-11-30',
	INTERVAL '2 day') as t(november);


SELECT
	strftime(date_series, '%Y-%m-%d') AS date,
	MONTH (date_series) as month,
	week(date_series) as week_number,
	weekday(date_series) as day_of_week,
from
	generate_series(DATE '2024-01-01',
	DATE '2024-12-31',
	INTERVAL '1 day') as t(date_series);
	

-- to create a date dimension  
CREATE TABLE IF NOT EXISTS dim_date AS (
SELECT
	strftime(date_series,
	'%Y-%m-%d') AS date,
	month(date_series) AS month,
	week(date_series) AS week_number,
	weekday(date_series) AS day_of_week,
FROM
	generate_series(DATE '2024-1-01',
	DATE '2024-12-31',
	INTERVAL 1 DAY) AS t(date_series));