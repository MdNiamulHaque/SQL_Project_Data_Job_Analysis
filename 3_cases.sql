-- January
CREATE TABLE IF NOT EXISTS january_jobs AS 
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

-- February
CREATE TABLE IF NOT EXISTS february_jobs AS 
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- March
CREATE TABLE IF NOT EXISTS march_jobs AS 
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 3;


select job_posted_date
from march_jobs;