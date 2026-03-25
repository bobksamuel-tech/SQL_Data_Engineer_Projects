/*
Question: What are the most in-demand skills for data engineers?
- Join job postings to inner join table similar to query 2
- Identify the top 10 in-demand skills for data engineers
- Focus on remote job postings
- Why? Retrieves the top 10 skills with the highest demand in the remote job market,
    providing insights into the most valuable skills for data engineers seeking remote work
*/

SELECT
    sd.skills,
    COUNT(jpf.*) AS demand_count    
FROM
    job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd 
    ON sjd.skill_id = sd.skill_id
WHERE
    jpf.job_title_short = 'Data Engineer' AND
    jpf.job_work_from_home = True
GROUp BY
    sd.skills
ORDER BY
    demand_count DESC
LIMIT 10;

/*
Here is the insight of the most demanded skills for the data engineer role;
1. SQL came the first with over 29,000 job posting and Python second with over 28,500.
2. AWS got the third line with almost 18,000 and Azure over 14,000.
3. Apache Spark is listed in top 5 with nearly 13,000 posting.

Key takeaway;
- SQL and Python are the important and fundamental for DE.
- Cloud platforms like AWS and Azure are criticle for morden world DE.
- Big data tools like spark is also considered.
- Data pipeline tools (Airflow, snowflaks, Databricks) shows growing too.
- Java and GCP out the top 10 so having them will boost your chances.

┌────────────┬──────────────┐
│   skills   │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        29221 │
│ python     │        28776 │
│ aws        │        17823 │
│ azure      │        14143 │
│ spark      │        12799 │
│ airflow    │         9996 │
│ snowflake  │         8639 │
│ databricks │         8183 │
│ java       │         7267 │
│ gcp        │         6446 │
├────────────┴──────────────┤
│ 10 rows         2 columns │
└───────────────────────────┘

*/