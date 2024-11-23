-- ' +' matches 1 or more spaces
select
	regexp_replace (trim(description), ' +', ' ', 'g') AS cleaned_description,
	regexp_replace (trim(lower(example)), ' +', ' ', 'g') AS lower_example,
from
	staging.sql_glossary;

-- filtering rows with LIKE operator
-- % matches 0 or more characters  
select * from staging.sql_glossary
where LOWER(description) LIKE '%select%';

-- \b makes it match exactly select word
select * from staging.sql_glossary
where regexp_matches (LOWER(description), 'select\b')