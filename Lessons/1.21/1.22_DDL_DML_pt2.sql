CREATE TABLE main.job_postings_flat AS
SELECT 
    jpf.job_id,
    jpf.job_title_short,
    jpf.job_title,
    jpf.job_location,
    jpf.job_via,
    jpf.job_schedule_type,
    jpf.job_work_from_home,
    jpf.posted_date,                                          
    jpf.job_no_degree_mention,
    jpf.job_health_insurance,
    jpf.job_country,
    jpf.salary_salary_year_avg,
    jpf.salary_hour_avg,
    cd.*
FROM job_postings_fact as jpf
LEFT JOIN company_dim as cd
    on jpf.company_id = cd.company_id
LIMIT 10;


                                 