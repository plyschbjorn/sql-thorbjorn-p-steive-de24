-- a) Created a database file called hemnet.duckdb

-- b) Make a wildcard selection to check the data

SELECT * FROM main.hemnet_data LIMIT 10;

-- c) Find out how many rows there are in the table

SELECT COUNT(*) AS row_count FROM main.hemnet_data;

-- d) Describe the table

DESCRIBE main.hemnet_data;

-- e) Find the 5 most expensive homes sold

SELECT * FROM main.hemnet_data ORDER BY final_price DESC LIMIT 5;

-- f) Find the 5 cheapest homes sold

SELECT * FROM main.hemnet_data ORDER BY final_price ASC LIMIT 5;

-- g) Statistics on home prices (min, mean, median, max)

SELECT MIN(final_price) AS min_price, AVG(final_price) AS mean_price, MEDIAN(final_price) AS median_price, MAX(final_price) AS max_price FROM main.hemnet_data;

-- h) Statistics on price per area

SELECT 
    MIN(price_per_area) AS min_price_per_area, ROUND(AVG(price_per_area)) AS mean_price_per_area, MEDIAN(price_per_area) AS median_price_per_area, MAX(price_per_area) AS max_price_per_area FROM main.hemnet_data;

-- i) Count of unique communes

   SELECT COUNT(DISTINCT commune) AS unique_communes FROM main.hemnet_data;
   
-- j) Percentage of homes costing more than 10 million

SELECT 
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM main.hemnet_data) AS percentage_above_10_million
FROM main.hemnet_data
WHERE final_price > 10000000;

  
-- k) Additional Exploration (Example: Average price by commune)

SELECT commune, AVG(final_price) AS average_price
FROM main.hemnet_data
GROUP BY commune
ORDER BY average_price DESC;