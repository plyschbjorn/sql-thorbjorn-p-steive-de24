-- we see many tables, let's investigate a few of them
DESC;

-- a) Describe all tables.

-- b) Select all data on all tables.

-- c) Find out how many rows there are in each table.

SELECT * FROM main.actor; -- 200
SELECT * FROM main.address; -- 603
SELECT * FROM main.category; -- 
SELECT * FROM main.city;
SELECT * FROM main.country;
SELECT * FROM main.customer;
SELECT * FROM main.customer_list;
SELECT * FROM main.film;
SELECT * FROM main.film_actor;
SELECT * FROM main.film_category;
SELECT * FROM main.film_list;
SELECT * FROM main.film_text;
SELECT * FROM main.inventory;
SELECT * FROM main.language;
SELECT * FROM main.payment;
SELECT * FROM main.rental;
SELECT * FROM main.sales_by_film_category;
SELECT * FROM main.sales_by_store;
SELECT * FROM main.staff;
SELECT * FROM main.staff_list;
SELECT * FROM main.store;
SELECT * FROM synthetic.products;
SELECT * FROM synthetic.sales_feb;
SELECT * FROM synthetic.sales_jan;

select * from schema;


DESC TABLE main.film;


-- d) Calculate descriptive statistics on film length.

SELECT sum(length)/count(title) FROM main.film;

SELECT * FROM main.film;


--  e) What are the peak rental times?

SELECT * FROM main.rental;


 -- per timme
SELECT
    strftime('%H', rental_date) AS time_rental,
    COUNT(rental_date) AS rental_count
FROM
    main.rental
GROUP BY time_rental
ORDER BY rental_count DESC;

--per timme och minut
SELECT
    strftime('%H:%M', rental_date) AS time_rental,
    COUNT(rental_date) AS rental_count
FROM
    main.rental
GROUP BY time_rental
ORDER BY rental_count DESC;

-- f) What is the distribution of film ratings?

SELECT * FROM main.film;

select rating, count(rating) as count from main.film
group by rating
order by count desc;

-- g) Who are the top 10 customers by number of rentals?

SELECT * FROM main.rental;
SELECT * FROM main.customer;

SELECT re.customer_id, cu.customer_id,cu.first_name,cu.last_name ,COUNT(re.customer_id) as nbr_rentals
FROM main.rental re
INNER JOIN main.customer cu ON re.customer_id = cu.customer_id
GROUP BY re.customer_id, cu.customer_id,cu.first_name,cu.last_name
ORDER BY nbr_rentals desc
LIMIT 10;


-- h) Retrieve a list of all customers and what films they have rented.

SELECT * FROM main.rental re;
SELECT * FROM main.customer cu;
SELECT * FROM main.film fi ;
SELECT * FROM main.inventory i;

SELECT cu.customer_id,cu.first_name,cu.last_name, fi.title 
FROM main.rental re
LEFT JOIN main.customer cu ON re.customer_id = cu.customer_id
LEFT JOIN main.inventory i ON i.inventory_id = re.inventory_id 
LEFT JOIN main.film fi ON i.film_id = fi.film_id
ORDER BY cu.customer_id;

-- i) Make a more extensive EDA of your choice on the Sakila database.


-- more EDAs left for reader as I don't want to take away all fun for you