desc;

select * from data_jobs;

select * from main.data_jobs;

select * from salaries.main.data_jobs;

select * from main.data_jobs limit 5;

select
	work_year,
	job_title,
	salary_in_usd,
	company_location
from
	main.data_jobs;


select * exclude (salary, work_year) from main.data_jobs;


select DISTINCT employment_type from main.data_jobs;

select * from main.data_jobs;