SELECT * FROM main.cleaned_salaries;


SELECT 
	min(salary_monthly_sek),
	median(salary_monthly_sek), 
	avg(salary_monthly_sek),
	max(salary_monthly_sek) 
FROM main.cleaned_salaries;

SELECT * FROM main.cleaned_salaries
order by salary_monthly_sek desc;

select count (*) from main.cleaned_salaries cs 
WHERE salary_monthly_sek > 310000; -- 158


select count (*) from main.cleaned_salaries cs 
WHERE salary_monthly_sek BETWEEN 230000 and 310000; -- 911

select count (*) from main.cleaned_salaries cs 
WHERE salary_monthly_sek BETWEEN 80000 and 230000; -- 12,595

select count (*) from main.cleaned_salaries cs 
WHERE salary_monthly_sek < 80000; -- 2,870


SELECT experience_level, count(experience_level),round(avg(salary_monthly_sek)) FROM main.cleaned_salaries
GROUP BY experience_level
ORDER BY round(avg(salary_monthly_sek));


UPDATE main.cleaned_salaries--
SET	salary_level = 'Insanely high'
WHERE salary_monthly_sek > 310000; 

UPDATE main.cleaned_salaries--
SET	salary_level = 'High'
WHERE salary_monthly_sek BETWEEN 230000 and 310000; 

UPDATE main.cleaned_salaries--
SET	salary_level = 'Medium'
WHERE salary_monthly_sek BETWEEN 80000 and 230000; 

UPDATE main.cleaned_salaries--
SET	salary_level = 'Low'
WHERE salary_monthly_sek < 80000;

