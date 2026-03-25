/*
Question: What are the highest-paying skills for data engineers?
- Calculate the median salary for each skill required in data engineer positions
- Focus on remote positions with specified salaries
- Include skill frequency to identify both salary and demand
- Why? Helps identify which skills command the highest compensation while also showing 
    how common those skills are, providing a more complete picture for skill development priorities
*/

SELECT
    sd.skills,
    ROUND(MEDIAN(jpf.salary_year_avg),0) AS median_salary,
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
HAVING COUNT(jpf.*) > 100
ORDER BY
    median_salary DESC
LIMIT 25;

/*

Key Insights & Analysis
- Rust ($\$210,000$) and Golang ($\$184,000$) are the top-paying languages. While their demand is lower than mainstream tools, companies are willing to pay a significant premium for the performance and concurrency benefits these modern languages offer in data pipelines.
- Terraform is the standout skill in this dataset. It ranks #3 in salary ($\$184,000$) but has a massive demand count ($3,248$). This indicates that cloud infrastructure management is not just highly valued but also widely adopted in high-paying remote roles.
- Tools like Neo4j (Graph database) and GraphQL (API query language) command high salaries ($\$170k+$). These are often used in specialized architectures, meaning fewer candidates have these skills, leading to higher compensation despite lower overall job volume.
- While Airflow ($9,996$ postings) and Kubernetes ($4,202$ postings) don't make the top 10 for absolute salary, their median salaries are still very high (around $\$150,000$). These represent the "standard stack" for senior data engineers—they are essential skills with huge market demand and reliable high compensation.
- Interestingly, GDPR awareness and Zoom proficiency appear in the high-salary list. This likely reflects senior management or consultancy roles within data engineering that require data privacy expertise and strong remote communication skills in high-stakes environments.

Takeaway: For the best return on effort, focusing on Terraform offers the highest combination of pay and opportunity. For those looking to enter the elite salary bracket ($\$200k+$), mastering Rust or Go for data systems is the clearest path.

┌────────────┬───────────────┬──────────────┐
│   skills   │ median_salary │ demand_count │
│  varchar   │    double     │    int64     │
├────────────┼───────────────┼──────────────┤
│ rust       │      210000.0 │          232 │
│ golang     │      184000.0 │          912 │
│ terraform  │      184000.0 │         3248 │
│ spring     │      175500.0 │          364 │
│ neo4j      │      170000.0 │          277 │
│ gdpr       │      169616.0 │          582 │
│ zoom       │      168438.0 │          127 │
│ graphql    │      167500.0 │          445 │
│ mongo      │      162250.0 │          265 │
│ fastapi    │      157500.0 │          204 │
│ bitbucket  │      155000.0 │          478 │
│ django     │      155000.0 │          265 │
│ crystal    │      154224.0 │          129 │
│ c          │      151500.0 │          444 │
│ atlassian  │      151500.0 │          249 │
│ typescript │      151000.0 │          388 │
│ kubernetes │      150500.0 │         4202 │
│ node       │      150000.0 │          179 │
│ ruby       │      150000.0 │          736 │
│ airflow    │      150000.0 │         9996 │
│ css        │      150000.0 │          262 │
│ redis      │      149000.0 │          605 │
│ vmware     │      148798.0 │          136 │
│ ansible    │      148798.0 │          475 │
│ jupyter    │      147500.0 │          400 │
├────────────┴───────────────┴──────────────┤
│ 25 rows                         3 columns │
└───────────────────────────────────────────┘

*/