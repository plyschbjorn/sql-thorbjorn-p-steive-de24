desc;

-- wildcard selection / selct * / select all
-- returns a rsult set of all columns and their respective rows
-- from the table/view: main.payment
-- when using main.payment we mean schema.table_name/schema.view_name -> namespacing
select * from main.payment;

-- without specifying schema, duckdb will look at main schema by default
select * from payment;

-- fully qualified name
select * from sakila.main.payment;

-- limit the number of returned rows
select * from main.payment p LIMIT 10;

-- choose which columns to return
select customer_id, amount from main.payment p;

-- returns all columns except customer_id and amount
select * exclude(customer_id, amount) from main.payment;

-- aggregation function -> many-to-one mapping
-- SUM, COUNT, MIN, MAX, AVG, MEDIAN

select 
	count(*) as number_payments,
	min(amount) as min_amount,
	round(avg(amount)) as mean_amount,
	median(amount) as medain_amount,
	max(amount) as max_amount
from main.payment;


-- filter data
-- where filters the rows with a condition
-- if the conditon os fulfulled 

select * from main.payment p where amount > 4.2 order BY amount ;



-- create a new column with amount classification

select amount,
	case
		when amount < 3.5 then 'low cost'
		when amount < 7.5 then 'medium cost'
		else 'high cost'
	end as cost_level
from main.payment p;



select *,
	case
		when amount < 3.5 then 'low cost'
		when amount < 7.5 then 'medium cost'
		else 'high cost'
	end as cost_level
from main.payment p;


select * exclude (payment_date,last_update),
	case
		when amount < 3.5 then 'low cost'
		when amount < 7.5 then 'medium cost'
		else 'high cost'
	end as cost_level
from main.payment p;



--

create view if not exists main.payment_level as
(
select *,
	case
		when amount < 3.5 then 'low cost'
		when amount < 7.5 then 'medium cost'
		else 'high cost'
	end as cost_level
from main.payment p
);


select * from main.payment_level;

select cost_level, count(amount) as number_per_level, round(avg(amount),2) as mean_amount
from main.payment_level group by cost_level;