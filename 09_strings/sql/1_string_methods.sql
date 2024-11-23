-- in this script we'll test out different string methods
select * from staging.sql_glossary;

-- array-like slicing is similar to Python, this is unique for duckdb, many other DBMS don't have this implemented 
select
	sql_word,
	sql_word[:2],
	sql_word[2:5]
from
	staging.sql_glossary;

-- getitem
select
	sql_word,
	sql_word[0], 
	sql_word[1], 
	sql_word[-1], 
from
	staging.sql_glossary;

-- concatenation
select 'fun' || ' joke'

select 'SQL command: ' || sql_word from staging.sql_glossary;

-- removes spaces 
select trim(sql_word, ' ') as trimmed_word, trimmed_word[1], trimmed_word[-1] from staging.sql_glossary;

-- transform character to upper case
select upper(trim(sql_word, ' ')) as trimmed_word, trimmed_word[1], trimmed_word[-1] from staging.sql_glossary;


-- removes all spaces, but we want to replace 2 or more spaces with 1 space
select replace(trim(description), ' ', '') from staging.sql_glossary;
