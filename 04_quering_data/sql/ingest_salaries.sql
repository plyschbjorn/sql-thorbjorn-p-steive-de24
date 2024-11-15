CREATE TABLE 
    IF NOT EXISTS data_jobs AS 
    (select * from read_csv_auto ('data/salaries.csv'));