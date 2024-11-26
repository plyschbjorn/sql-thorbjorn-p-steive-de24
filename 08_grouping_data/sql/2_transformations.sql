-- based on what we find in eda we transform the dataset

-- change name of id into food

-- remove google topic column

-- change value into number_of_searches

SELECT  * FROM main.food f ;

SELECT
	id as food,
	week_id AS week,
	SUBSTRING(week, 1,4) AS year, 
	week[:4] as year,
	value AS number_searches
FROM
	main.food;

CREATE TABLE IF NOT EXISTS cleaned_food AS (
SELECT
	id as food,
	week_id AS week,
	SUBSTRING(week, 1,4) AS year, 
	value AS number_searches
FROM
	main.food);
	


SELECT  * FROM main.cleaned_food cf ;


select * from table main.food;