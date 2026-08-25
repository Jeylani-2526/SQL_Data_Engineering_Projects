SELECT CAST('234', as INTEGER)


SELECT 
    job_id,
    CAST(job_work_from_home as INT),
    job_posted_date,
    salary_year_avg
FROM
    job_postings_fact
LIMIT 10;

SELECT (3+5.5) :: INT;