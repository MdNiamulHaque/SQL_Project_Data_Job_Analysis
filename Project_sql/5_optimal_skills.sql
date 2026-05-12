WITH skills_demand as (
    SELECT 
        skills_id.skills_id,
        skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    from job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' AND salary is not null AND job_work_from_home = TRUE
    GROUP BY 
        skills
    ORDER BY 
        skill_id
   
)

with average_salary as (

    SELECT 
        skills_id.skill_id,
        skills
        ROUND(AVG(salary_year_avg),0) as avg_salary
    from job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' AND salary is not null--job_work_from_home = TRUE
    GROUP BY 
        skills
    ORDER BY 
       skill_id
        --demand_count DESC
    
)

SELECT 
    skills_demand.skill_id,
    skills_demand.skill,
    demand_count,
    avg_salary
FROM 
    skills_demand
INNER JOIN average salary on skills_demand.skill_id = average_salary.skill_id

ORDER BY 
    demand_count DESC,
    avg_salary DESC
LIMIT 25