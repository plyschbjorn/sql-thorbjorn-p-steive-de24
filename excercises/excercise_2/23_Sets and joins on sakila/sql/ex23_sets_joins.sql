--  a) Retrieve a list of all customers and actors which last name starts with G.

select c.first_name, c.last_name from main.customer c where c.last_name like 'G%'
UNION ALL
select a.first_name, a.last_name from main.actor a where a.last_name like 'G%';

--  b) How many customers and actors have the letters 'ann' in there first names?

select c.first_name, c.last_name from main.customer c where c.first_name like '%ANN%'
UNION ALL
select a.first_name, a.last_name from main.actor a where a.first_name like '%ANN%';


--  c) In which cities and countries do the customers live in?

select distinct city,country from main.customer_list cl;

--  d) In which cities and countries do the customers with initials JD live in?

SELECT cl.country,cl.city,c.first_name,c.last_name from main.customer c 
INNER JOIN main.customer_list cl on cl.id = c.customer_id 
WHERE c.first_name like 'J%' and c.last_name like 'D%'


--  e) Retrieve a list of all customers and what films they have rented.

--  f) What else cool information can you find out with this database using what you know about SQL.

