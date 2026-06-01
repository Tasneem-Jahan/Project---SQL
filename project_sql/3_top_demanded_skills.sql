-- The below query retrieves the top 5 most demanded skills for 'Data Analyst' jobs. It joins the job_postings_fact table with the skills_job_dim and skills_dim tables to get the skill names, and filters the results based on the specified job title. The results are grouped by skill and ordered by demand count in descending order, showing only the top 5 skills.
SELECT skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5