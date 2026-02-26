WITH skillsDemand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        count (skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    GROUP BY
        skills_dim.skill_id  
    ), avgSalary AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        ROUND (AVG(salary_year_avg),0 )as avgSalary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    GROUP BY
        skills_dim.skill_id
)
SELECT
    skillsDemand.skill_id,
    skillsDemand.skills,
    demand_count,
    avgSalary
FROM
    skillsDemand
INNER JOIN avgSalary on skillsDemand.skill_id = avgSalary.skill_id
WHERE 
    demand_count > 10
ORDER BY 
    avgSalary DESC,
    demand_count DESC
    
LIMIT 25