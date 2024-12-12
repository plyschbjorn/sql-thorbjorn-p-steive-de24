CREATE schema if not exists sql;

select * from information_schema.schemata;


CREATE TABLE IF NOT EXISTS sql.excercises (
	study_week INT PRIMARY KEY,
	excercise TEXT,
	studied BOOLEAN

);

CREATE TABLE IF NOT EXISTS sql.lectures (
	study_week INT PRIMARY KEY,
	content TEXT,
	lecture TEXT,
	studied BOOLEAN

);

INSERT INTO
    sql.lectures
VALUES
    (
        1,
        'intro, query, ingest csv, CLI, dbeaver, table, select',
        '00-04',
        TRUE
    ),
    (
        2,
        'filtering, CRUD, conditionals, sorting, functions, grouping',
        '05-08',
        TRUE
    ),
    (
        3,
        'grouping, strings, regexp, set operations, performing joins, querying multiple tables',
        '09-11',
        FALSE
    ),
    (
        4,
        'window functions, CTEs, connect duckdb to Python, data security, SQL injection',
        '12-14',
        FALSE
    ),
    (
        5,
        'duckdb tips and tricks, repetition',
        '15-16',
        TRUE
    ),
    (6, 'exam', '17', FALSE);

INSERT INTO
    sql.excercises
VALUES
    (1, '0', TRUE),
    (2, '1', TRUE),
    (3, '2', TRUE),
    (4, '3', TRUE),
    (5, 'old exam', TRUE);

   
********************************
SELECT * FROM sql.lectures;

SELECT * FROM sql.excercises;

*********************************

-- want to update week 4,6 to studied 
SELECT * FROM sql.lectures
WHERE study_week IN (4, 6);

UPDATE sql.lectures
SET studied = TRUE
WHERE study_week IN (4, 6);

SELECT * FROM sql.lectures;

************************************

-- search for strings
SELECT * FROM sql.lectures
WHERE content LIKE '%string%';

-- search for python case insensitive
SELECT * FROM sql.lectures
WHERE LOWER(content) LIKE '%python%';

-- or with ILIKE
SELECT * FROM sql.lectures
WHERE content ILIKE '%StRiNg%';

************************************

-- joining both lectures and exercises
SELECT * FROM sql.lectures l
LEFT JOIN sql.excercises e ON l.study_week = e.study_week;

SELECT * FROM sql.lectures l
INNER JOIN sql.excercises e ON l.study_week = e.study_week;

*************************************