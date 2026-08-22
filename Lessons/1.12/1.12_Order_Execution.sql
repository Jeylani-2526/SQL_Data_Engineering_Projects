--     EXPLAIN ANALYSE
SELECT 
    cd.name as company_name,
    COUNT(jpf.job_id) as posting_count
FROM job_postings_fact as jpf
LEFT JOIN company_dim as cd
    ON jpf.company_id = cd.company_id  
WHERE jpf.job_country = 'United States'
Group by cd.name
Having COUNT(jpf.job_id) > 3000
ORDER BY posting_count DESC;


