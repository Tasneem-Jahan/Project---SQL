-- The below query retrieves the top 5 highest paying skills for 'Data Analyst' jobs. It joins the job_postings_fact table with the skills_job_dim and skills_dim tables to get the skill names and their associated average salaries. The results are filtered based on the specified job title, grouped by skill, and ordered by average salary in descending order, showing only the top 5 skills.
SELECT skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 5