
-- a) Generate 10 rows of dice rolls data

SELECT FLOOR(RANDOM () * 6+1) AS dice FROM generate_series(1,10);

-- b) Calculate the average of getting a six

WITH DiceRolls AS (
    SELECT FLOOR(RANDOM() * 6 + 1) AS dice
    FROM generate_series(1, 10)
)
SELECT 
    AVG(CASE WHEN dice = 6 THEN 1 ELSE 0 END) AS average_six
FROM DiceRolls;

-- c) Generate 100 rows of dice rolls and calculate average of getting a six
WITH DiceRolls AS (
    SELECT FLOOR(RANDOM() * 6 + 1) AS dice
    FROM generate_series(1, 100)
)
SELECT 
    AVG(CASE WHEN dice = 6 THEN 1 ELSE 0 END) * 100 AS average_six
FROM DiceRolls;


-- d) Repeat the experiment with 1000, 10000, 100000, 1000000 rolls.
WITH DiceRolls AS (
    SELECT FLOOR(RANDOM() * 6 + 1) AS dice
    FROM generate_series(1, 1000000)
)
SELECT 
    AVG(CASE WHEN dice = 6 THEN 1 ELSE 0 END) * 100 AS average_six
FROM DiceRolls;

-- e) What is the theoretical mean?
Oavsett hur många slag så är avg 1/6 = 16,66 %

