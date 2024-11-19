select * from main.data_jobs dj;


CREATE TABLE IF NOT EXISTS cleaned_salaries AS (
SELECT
	experience_level, 
	employment_type, 
	job_title, 
	round(salary_in_usd*10.94) AS salary_annual_sek, 
	round(salary_annual_sek/12) AS salary_monthly_sek, 
	remote_ratio, 
	company_size, 
	job_title AS salary_level
FROM
	main.data_jobs dj)
	
select distinct remote_ratio from main.cleaned_salaries;

drop table main.cleaned_salaries;


select * from main.data_jobs dj
where salary != salary_in_usd;



	
	