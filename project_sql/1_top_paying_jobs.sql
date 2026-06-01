-- The below query retrieves the top 10 highest paying 'Data Analyst' jobs that are available 'Anywhere'. It joins the job_postings_fact table with the company_dim table to get the company name, and filters the results based on the specified job title, location, and non-null salary. The results are ordered by average yearly salary in descending order.
SELECT job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;