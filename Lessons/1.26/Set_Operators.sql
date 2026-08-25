CREATE TEMP TABLE jobs_2023 as
SELECT * EXCLUDE(job_id, job_posted_date)
FROM job_postings_fact
WHERE EXTRACT(YEAR FROM job_posted_date) = 2023;

 SELECT * FROM jobs_2023;

 CREATE TEMP TABLE jobs_2024 as
SELECT * EXCLUDE(job_id, job_posted_date)
FROM job_postings_fact
WHERE EXTRACT(YEAR FROM job_posted_date) = 2024;

 SELECT * FROM jobs_2024;
 
-- What job postings appeared across both years, counting duplicates
 SELECT COUNT(*) FROM jobs_2023
 UNION ALL
SELECT COUNT(*) FROM jobs_2024

-- Which job postings appeared in 2023 but not in 2024
SELECT COUNT(*) FROM jobs_2023
EXCEPT
SELECT COUNT(*) FROM jobs_2024

-- WHich job postings appeared in both 2023 and 2024
SELECT COUNT(*) FROM jobs_2023
INTERSECT
SELECT COUNT(*) FROM jobs_2024

