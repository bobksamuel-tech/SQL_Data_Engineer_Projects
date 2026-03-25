SELECT
    jpf.job_id,
    jpf.job_title_short,
    cd.company_id,
    cd.name AS comapny_name,
    jpf.job_location
FROM
    job_postings_fact AS jpf 
LEFT JOIN company_dim AS cd 
    ON jpf.company_id = cd.company_id
LIMIT 10;

SELECT
    jpf.job_id,
    jpf.job_title_short,
    cd.company_id,
    cd.name AS comapny_name,
    jpf.job_location
FROM
    job_postings_fact AS jpf 
RIGHT JOIN company_dim AS cd 
    ON jpf.company_id = cd.company_id
LIMIT 10;

SELECT *
FROM skill_dim
LIMIT 10;

SELECT
    jpf.job_id,
    jpf.job_title_short,
    sdj.skill_id,
    sd.skills
FROM
    job_postings_fact AS jpf
LEFT JOIN skills_job_dim AS sdj
    ON jpf.job_id = sdj.job_id
LEFT JOIN skills_dim AS sd
    ON sdj.skill_id = sd.skill_id
LIMIT 10;

SELECT
    jpf.job_id,
    jpf.job_title_short,
    sdj.skill_id,
    sd.skills
FROM
    job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sdj
    ON jpf.job_id = sdj.job_id
INNER JOIN skills_dim AS sd
    ON sdj.skill_id = sd.skill_id
LIMIT 10;