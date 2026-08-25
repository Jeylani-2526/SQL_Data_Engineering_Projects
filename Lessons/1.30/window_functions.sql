-- count rows - aggregation only

SELECT 
    count(*)
FROM
    job_postings_fact;



-- count row - window function

select 
    job_id,
    count(*) over ()
FROM
    job_postings_fact;

-- partition by 
SELECT 
    job_id,
    job_title_short,
    company_id,
    salary_hour_avg,
    avg(salary_hour_avg) OVER (
        partition by job_title_short, company_id
    )
FROM    job_postings_fact
where salary_hour_avg is not null
ORDER BY RANDOM()
limit 10
;

-- order by 
SELECT 
    job_id,
    job_title_short,
    salary_hour_avg,
    RANK() OVER (
       ORDER BY salary_hour_avg desc
    )as rank_hour_salary
FROM    
    job_postings_fact
where 
    salary_hour_avg is not null
ORDER BY 
    salary_hour_avg desc
limit 10
;

-- partition by & order by

SELECT 
    job_posted_date,
    job_title_short,
    salary_hour_avg,
    avg(salary_hour_avg) OVER (
        partition by job_title_short 
        order by job_posted_date
    )as running_avg_hourly_by_title
FROM    
    job_postings_fact
where 
    salary_hour_avg is not null
ORDER BY 
    job_title_short,
    job_posted_date
limit 10
;

-- aggregate functions
SELECT 
    job_posted_date,
    job_title_short,
    salary_hour_avg,
    max(salary_hour_avg) OVER (
        partition by job_title_short 
        order by job_posted_date
    )as running_avg_hourly_by_title
FROM    
    job_postings_fact
where 
    salary_hour_avg is not null and
    job_title_short = 'Data Engineer'
ORDER BY 
    job_title_short,
    job_posted_date
limit 10;


--ranking functions

SELECT 
    job_id,
    job_title_short,
    salary_hour_avg,
    DENSE_RANK() OVER (
       ORDER BY salary_hour_avg desc
    )as rank_hour_salary
FROM    
    job_postings_fact
where 
    salary_hour_avg is not null
ORDER BY 
    salary_hour_avg desc
limit 20
;


-- ROW_NUMBER()
SELECT 
    *,
    ROW_NUMBER() OVER (
       ORDER BY job_posted_date
    )as rank_hour_salary
FROM    
    job_postings_fact
-- where 
--     salary_hour_avg is not null
ORDER BY 
    job_posted_date 
limit 20
;


--lag()
SELECT 
    job_id,
    job_title,
    job_title_short,
    company_id,
    job_posted_date,
    salary_year_avg,
    lag(salary_year_avg) OVER (
        partition by company_id
        order by job_posted_date
    )as previous_posting_salary
FROM    
    job_postings_fact
where 
    salary_year_avg is not null
ORDER BY 
    company_id, job_posted_date
limit 10
;