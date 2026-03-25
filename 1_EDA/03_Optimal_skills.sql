/*
Question: What are the most optimal skills for data engineers—balancing both demand and salary?
- Create a ranking column that combines demand count and median salary to identify the most valuable skills.
- Focus only on remote Data Engineer positions with specified annual salaries.
- Why?
    - This approach highlights skills that balance market demand and financial reward. It weights core skills appropriately instead of letting rare, outlier skills distort the results.
    - The natural log transformation ensures that both high-salary and widely in-demand skills surface as the most practical and valuable to learn for data engineering careers.
*/


SELECT
    sd.skills,
    ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
    COUNT(jpf.*) AS demand_count,
    ROUND(LN(COUNT(jpf.*)), 1) AS ln_demand_count,
    ROUND(MEDIAN(jpf.salary_year_avg) * LN(COUNT(jpf.*))/1_000_000, 2) AS optimal_score
FROM
    job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd 
    ON sjd.skill_id = sd.skill_id
WHERE
    jpf.job_title_short = 'Data Engineer' 
    AND
    jpf.job_work_from_home = True
    AND
    jpf.salary_year_avg IS NOT NULL
GROUp BY
    sd.skills
HAVING COUNT(jpf.*) > 100
ORDER BY
    optimal_score DESC
LIMIT 25;

/*

These skills have a lower demand count than SQL/Python, but their Median Salary is significantly higher. This indicates a "specialist premium."

- Terraform ($184,000): This is your #1 Optimal Skill. While demand is lower (193), the pay is massive. This shows the market's shift toward Infrastructure as Code (IaC). Companies want engineers who can build environments, not just write scripts.
- Airflow ($150,000): Orchestration is king. Knowing how to manage complex DAGs and pipeline schedules adds a $15k–$20k premium to your base salary.
- Kafka ($145,000): Real-time streaming is a specialized high-tier skill. It pays better than batch-heavy tools because it's harder to master and maintain.

Modern Data Warehouse Leaders:

- The battle between Cloud Data Warehouses is visible here, and they are essential for your portfolio.
- Snowflake ($135,500): With 438 postings, it has nearly double the demand of Redshift (274) in your top list, showing it is currently the preferred warehouse for many modern data stacks.
- Spark ($140,000): Essential for Big Data processing. If you are doing an MBA in Data Science, this is the bridge between pure engineering and high-scale data processing.

Key Strategic Insights:

- The IaC Gold Rush: Terraform has the highest salary on the list. If you want to jump to the next salary bracket, learning to automate infrastructure is your fastest path.
- Breadth vs. Depth: Python and SQL ensure you get the interview (high demand), but Terraform, Airflow, and Kafka ensure you get the high offer (high salary).
- The Cloud Preference: AWS is leading Azure in both pay and demand in this specific dataset. If you are choosing a cloud certification, start with AWS.
- Optimal Scoring: Note that Python has a lower salary than Kafka, but a higher Optimal Score (0.95 vs 0.82). This is because the massive demand for Python makes it a "safer" and more versatile bet for your career.

┌────────────┬───────────────┬──────────────┬─────────────────┬───────────────┐
│   skills   │ median_salary │ demand_count │ ln_demand_count │ optimal_score │
│  varchar   │    double     │    int64     │     double      │    double     │
├────────────┼───────────────┼──────────────┼─────────────────┼───────────────┤
│ terraform  │      184000.0 │          193 │             5.3 │          0.97 │
│ python     │      135000.0 │         1133 │             7.0 │          0.95 │
│ aws        │      137320.0 │          783 │             6.7 │          0.91 │
│ sql        │      130000.0 │         1128 │             7.0 │          0.91 │
│ airflow    │      150000.0 │          386 │             6.0 │          0.89 │
│ spark      │      140000.0 │          503 │             6.2 │          0.87 │
│ kafka      │      145000.0 │          292 │             5.7 │          0.82 │
│ snowflake  │      135500.0 │          438 │             6.1 │          0.82 │
│ azure      │      128000.0 │          475 │             6.2 │          0.79 │
│ java       │      135000.0 │          303 │             5.7 │          0.77 │
│ scala      │      137290.0 │          247 │             5.5 │          0.76 │
│ kubernetes │      150500.0 │          147 │             5.0 │          0.75 │
│ git        │      140000.0 │          208 │             5.3 │          0.75 │
│ databricks │      132750.0 │          266 │             5.6 │          0.74 │
│ redshift   │      130000.0 │          274 │             5.6 │          0.73 │
│ gcp        │      136000.0 │          196 │             5.3 │          0.72 │
│ hadoop     │      135000.0 │          198 │             5.3 │          0.71 │
│ nosql      │      134415.0 │          193 │             5.3 │          0.71 │
│ pyspark    │      140000.0 │          152 │             5.0 │           0.7 │
│ docker     │      135000.0 │          144 │             5.0 │          0.67 │
│ mongodb    │      135750.0 │          136 │             4.9 │          0.67 │
│ r          │      134775.0 │          133 │             4.9 │          0.66 │
│ go         │      140000.0 │          113 │             4.7 │          0.66 │
│ github     │      135000.0 │          127 │             4.8 │          0.65 │
│ bigquery   │      135000.0 │          123 │             4.8 │          0.65 │
├────────────┴───────────────┴──────────────┴─────────────────┴───────────────┤
│ 25 rows                                                           5 columns │
└─────────────────────────────────────────────────────────────────────────────┘

*/