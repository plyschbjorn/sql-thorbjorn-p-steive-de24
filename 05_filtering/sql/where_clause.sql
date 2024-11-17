select * from main.data_jobs dj;

select count(*) as jobs_lower_than_50k from main.data_jobs where salary_in_usd <50000;

select * from main.data_jobs where experience_level = 'EN' ;

select median(salary_in_usd) as median_salary_usd from main.data_jobs where experience_level = 'EN' ;

select median(salary_in_usd) as median_salary_usd from main.data_jobs where experience_level = 'MI' ;

select median(salary_in_usd) as median_salary_usd from main.data_jobs where experience_level = 'EX' ;
