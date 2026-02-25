SELECT 
    skills,
    ROUND (AVG(salary_year_avg),0 )as avgSalary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    avgSalary DESC
LIMIT 25

/*
[
  {
    "skills": "pyspark",
    "avgsalary": "208172"
  },
  {
    "skills": "bitbucket",
    "avgsalary": "189155"
  },
  {
    "skills": "couchbase",
    "avgsalary": "160515"
  },
  {
    "skills": "watson",
    "avgsalary": "160515"
  },
  {
    "skills": "datarobot",
    "avgsalary": "155486"
  },
  {
    "skills": "gitlab",
    "avgsalary": "154500"
  },
  {
    "skills": "swift",
    "avgsalary": "153750"
  },
  {
    "skills": "jupyter",
    "avgsalary": "152777"
  },
  {
    "skills": "pandas",
    "avgsalary": "151821"
  },
  {
    "skills": "elasticsearch",
    "avgsalary": "145000"
  },
  {
    "skills": "golang",
    "avgsalary": "145000"
  },
  {
    "skills": "numpy",
    "avgsalary": "143513"
  },
  {
    "skills": "databricks",
    "avgsalary": "141907"
  },
  {
    "skills": "linux",
    "avgsalary": "136508"
  },
  {
    "skills": "kubernetes",
    "avgsalary": "132500"
  },
  {
    "skills": "atlassian",
    "avgsalary": "131162"
  },
  {
    "skills": "twilio",
    "avgsalary": "127000"
  },
  {
    "skills": "airflow",
    "avgsalary": "126103"
  },
  {
    "skills": "scikit-learn",
    "avgsalary": "125781"
  },
  {
    "skills": "jenkins",
    "avgsalary": "125436"
  },
  {
    "skills": "notion",
    "avgsalary": "125000"
  },
  {
    "skills": "scala",
    "avgsalary": "124903"
  },
  {
    "skills": "postgresql",
    "avgsalary": "123879"
  },
  {
    "skills": "gcp",
    "avgsalary": "122500"
  },
  {
    "skills": "microstrategy",
    "avgsalary": "121619"
  }
] */