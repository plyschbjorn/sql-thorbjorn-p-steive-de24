CREATE TABLE IF NOT EXISTS sql_course(
    content VARCHAR PRIMARY KEY,
    week INTEGER,
    content_type VARCHAR
);

INSERT
    INTO
        sql_course(content,
        week,
        content_type
        )  
    VALUES
    ('00_intro',
    46,
    'lecture'),
    ('01_course_structure',
    46,
    'lecture'),
    ('02_setup_duckdb',
    46,
    'lecture'),
    ('03_setup_dbeaver',
    46,
    'lecture'),
    ('04_querying_data',
    46,
    'lecture'),
    ('exercise_0',
    46,
    'exercise'),
    ('05_filtering',
    47,
    'lecture'),
    ('06_crud_operations',
    47,
    'lecture'),
    ('07_generating_data',
    47,
    'lecture'),
    ('08_grouping_data',
    47,
    'lecture'),
    ('exercise_1',
    47,
    'exercise'),
    ('09_strings',
    48,
    'lecture'),
    ('10_set_operations',
    48,
    'lecture'),
    ('11_joins',
    48,
    'lecture'),
    ('exercise_2',
    48,
    'exercise'),
    ('12_cte',
    49,
    'lecture'),
    ('13_macros',
    49,
    'lecture'),
    ('14_python_duckdb',
    49,
    'lecture'),
    ('exercise_3',
    49,
    'exercise'),
    ('15_sql_injection',
    50,
    'lecture'),
    ('16_duckdb_tricks',
    50,
    'lecture'),
    ('17_repetiton',
    51,
    'lecture'),
    ('exam',
    51,
    'exam');

-- DROP TABLE main.sql_course;


SELECT * FROM main.sql_course;

   
-- All the scripts--
   
   
-- a) Select all the exercises in this course
SELECT * FROM main.sql_course WHERE content_type = 'exercise';

-- b) Select all the lectures in this course
SELECT * FROM main.sql_course WHERE content_type = 'lecture';

-- c) Select all records for week 48
SELECT * FROM main.sql_course WHERE week = 48;

-- d) Select all records for weeks 47–49
SELECT * FROM main.sql_course WHERE week BETWEEN 47 AND 49;

-- e) How many lectures are in the table?
SELECT COUNT(*) AS num_lectures FROM main.sql_course WHERE content_type = 'lecture';

-- f) How many other content types are there?
SELECT COUNT(*) AS other_content FROM main.sql_course WHERE content_type != 'lecture';

-- g) What are the unique content types in this table?
SELECT DISTINCT content_type FROM main.sql_course;

-- h) Delete the row with 02_setup_duckdb and add it again
DELETE FROM main.sql_course WHERE content = '02_setup_duckdb';

INSERT INTO main.sql_course (content, week, content_type)
VALUES ('02_setup_duckdb', 46, 'lecture');

-- i) Sort the table by weeks in ascending order
SELECT * FROM main.sql_course ORDER BY week ASC,content ASC;

-- j) Choose your own exploration query
-- * Total number of entries per week
SELECT week, COUNT(*) AS entries_per_week FROM main.sql_course GROUP BY week ORDER BY week;

-- * Content types distribution
SELECT content_type, COUNT(*) AS count FROM main.sql_course GROUP BY content_type ORDER BY count DESC;




