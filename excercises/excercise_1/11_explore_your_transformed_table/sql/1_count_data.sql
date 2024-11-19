select * from main.cleaned_salaries;


-- a) Count number of Data engineers jobs. For simplicity just go for job_title Data Engineer.

select count (*) from main.cleaned_salaries where job_title = 'Data Engineer'; --3,464

-- b) Count number of unique job titles in total.

select count(distinct job_title) from main.cleaned_salaries; -- 155

-- c) Find out how many jobs that goes into each salary level.

select salary_level, count(*) as total_nbr from main.cleaned_salaries group by salary_level order by total_nbr;

salary_level |total_nbr|
-------------+---------+
Insanely high|      158|
High         |      911|
Low          |     2870|
Medium       |    12595|

-- d) Find out the median and mean salaries for each seniority levels.

select experience_level, median(salary_monthly_sek)median_salary_sek, round(avg(salary_monthly_sek)) as mean_salary_sek 
from main.cleaned_salaries group by experience_level order by median_salary_sek;

experience_level|median_salary_sek|mean_salary_sek|
----------------+-----------------+---------------+
Entry level     |          75668.0|        84172.0|
Mid level       |         104842.0|       114800.0|
Senior          |         141308.0|       149206.0|
Expert          |         175040.0|       178016.0|

-- e) Find out the top earning job titles based on their median salaries and how much they earn.

select job_title, median(salary_monthly_sek)median_salary_sek, round(avg(salary_monthly_sek)) as mean_salary_sek 
from main.cleaned_salaries group by job_title order by median_salary_sek DESC;

-- f) How many percentage of the jobs are fully remote, 50 percent remote and fully not remote.

select remote_ratio, count(*) as nbr_remote from main.cleaned_salaries group by remote_ratio;

SELECT 
    remote_ratio,
    COUNT(*) AS nbr_people,
    ROUND((COUNT(*) * 100 / total.total_count),2) AS percent
FROM 
    main.cleaned_salaries,
    (SELECT COUNT(*) AS total_count FROM main.cleaned_salaries) AS total
GROUP BY 
    remote_ratio, total.total_count
ORDER BY 
    remote_ratio;

   
SELECT 
    remote_ratio,
    COUNT(*) AS nbr_people,
    ROUND((COUNT(*) * 100) / SUM(COUNT(*)) OVER (), 2) AS percent
FROM 
    main.cleaned_salaries
GROUP BY 
    remote_ratio
ORDER BY 
    remote_ratio;   
   
   
-- g) Pick out a job title of interest and figure out if company size affects the salary. 
--    Make a simple analysis as a comprehensive one requires causality investigations which are much harder to find.

   
select random job_titel from main.cleaned_salaries cs;
   
(SELECT job_title FROM main.cleaned_salaries cs 
ORDER BY RANDOM()
LIMIT 1);

select company_size, job_title ,median(salary_monthly_sek)median_salary_sek, round(avg(salary_monthly_sek)) as mean_salary_sek 
from main.cleaned_salaries cs where job_title = 'Data Engineer'
group by company_size,job_title; 


select company_size, job_title,
	min(salary_monthly_sek) as min_salary_sek,
	median(salary_monthly_sek) as median_salary_sek, 
	round(avg(salary_monthly_sek)) as mean_salary_sek,
	max(salary_monthly_sek) as max_salary_sek
	
from main.cleaned_salaries cs 

where job_title in
(
SELECT job_title FROM main.cleaned_salaries cs 
ORDER BY RANDOM()
LIMIT 1
)
group by company_size,job_title; 

   
-- h) Feel free to explore other things