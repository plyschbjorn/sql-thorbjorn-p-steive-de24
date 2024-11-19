SELECT * FROM main.cleaned_salaries;

select DISTINCT experience_level from main.cleaned_salaries;


UPDATE main.cleaned_salaries
SET
	experience_level = 
	CASE 
		WHEN experience_level = 'SE' THEN 'Senior'
		WHEN experience_level = 'MI' THEN 'Mid level'
		WHEN experience_level = 'EN' THEN 'Entry level'
		WHEN experience_level = 'EX' THEN 'Expert'
	END;
	
-----------------------------------------------------------------

select DISTINCT employment_type from main.cleaned_salaries;


UPDATE main.cleaned_salaries
SET
	employment_type = 
	CASE 
		WHEN employment_type = 'FT' THEN 'Full time'
		WHEN employment_type = 'CT' THEN 'Contract'
		WHEN employment_type = 'PT' THEN 'Part time'
		WHEN employment_type = 'FL' THEN 'Freelance'
	END
WHERE employment_type IN ('FT', 'CT', 'PT', 'FL');

-----------------------------------------------------------------

select DISTINCT company_size from main.cleaned_salaries;



UPDATE main.cleaned_salaries
SET
	company_size = 
	CASE 
		WHEN company_size = 'L' THEN 'Large'
		WHEN company_size = 'S' THEN 'Small'
		WHEN company_size = 'M' THEN 'Medium'
	END
WHERE company_size IN ('L', 'S', 'M');

-----------------------------------------------------------------

select DISTINCT company_size from main.cleaned_salaries;



UPDATE main.cleaned_salaries
SET
	company_size = 
	CASE 
		WHEN company_size = 'L' THEN 'Large'
		WHEN company_size = 'S' THEN 'Small'
		WHEN company_size = 'M' THEN 'Medium'
	END
WHERE company_size IN ('L', 'S', 'M');

-----------------------------------------------------------------
