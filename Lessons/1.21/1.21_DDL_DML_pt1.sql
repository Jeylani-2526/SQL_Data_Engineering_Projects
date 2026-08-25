-- .read 'Lessons\1.21\1.21_DDL_DML_pt1.sql'
USE data_jobs;

DROP DATABASE IF EXISTS job_mart;

CREATE DATABASE IF NOT EXISTS job_mart;

SHOW DATABASES;


SELECT *
FROM information_schema.schemata;

USE job_mart;

CREATE SCHEMA IF NOT EXISTS staging;

CREATE TABLE IF NOT EXISTS staging.preferred_roles (
    role_id INTEGER,
    role_name VARCHAR
 );

SELECT * 
FROM information_schema.tables
WHERE table_catalog = 'jobs_mart';

DROP TABLE IF EXISTS main.preferred_roles;
 