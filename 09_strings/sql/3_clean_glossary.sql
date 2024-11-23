CREATE SCHEMA IF NOT EXISTS refined;

CREATE TABLE
    IF NOT EXISTS refined.sql_glossary AS (
        SELECT
            UPPER(TRIM(sql_word)) AS sql_word,
            description,
            example
        FROM
            staging.sql_glossary
    );

-- TODO for the reader -- do more cleaning --
   

select * from refined.sql_glossary;
   
   
SELECT 
	UPPER(TRIM(sql_word)) AS sql_word,
	regexp_replace (trim(description), ' +', ' ', 'g') AS description,
   	regexp_replace (lower(trim(example)), ' +', ' ', 'g') AS example
FROM
	staging.sql_glossary;



-- update the table with more cleaning --

   
UPDATE refined.sql_glossary
SET 
    sql_word = UPPER(TRIM(sql_word)),
    description = regexp_replace(TRIM(description), ' +', ' ', 'g'),
    example = regexp_replace(LOWER(TRIM(example)), ' +', ' ', 'g');