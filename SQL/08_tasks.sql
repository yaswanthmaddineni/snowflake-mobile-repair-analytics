-- 08_tasks.sql
-- Create Snowflake Tasks to automate staging and mart refresh

USE DATABASE TECHY_PROJECT;

CREATE OR REPLACE TASK RAW.REFRESH_STAGING_TASK
WAREHOUSE = TECHY_WH
SCHEDULE = '1 MINUTE'
AS
CREATE OR REPLACE TABLE STAGING.STG_REPAIRS AS
SELECT
    ROW_NUMBER() OVER (ORDER BY transaction_date, customer_name) AS repair_id,
    transaction_date,
    YEAR(transaction_date) AS repair_year,
    MONTH(transaction_date) AS repair_month,
    TO_CHAR(transaction_date, 'MMMM') AS month_name,
    TRIM(customer_name) AS customer_name,
    TRIM(phone_model) AS phone_model,
    TRIM(repair_type) AS repair_type,
    part_cost,
    labor_cost,
    total_amount,
    total_amount - part_cost AS gross_profit,
    TRIM(payment_method) AS payment_method,
    TRIM(technician) AS technician,
    CURRENT_TIMESTAMP() AS loaded_at
FROM RAW.REPAIR_TRANSACTIONS;

CREATE OR REPLACE TASK RAW.REFRESH_MART_TASK
WAREHOUSE = TECHY_WH
AFTER RAW.REFRESH_STAGING_TASK
AS
CREATE OR REPLACE TABLE MART.FACT_REPAIRS AS
SELECT
    repair_id,
    transaction_date,
    repair_year,
    repair_month,
    month_name,
    customer_name,
    phone_model,
    repair_type,
    technician,
    payment_method,
    part_cost,
    labor_cost,
    total_amount AS revenue,
    gross_profit,
    loaded_at
FROM STAGING.STG_REPAIRS;

-- Start tasks
ALTER TASK RAW.REFRESH_STAGING_TASK RESUME;
ALTER TASK RAW.REFRESH_MART_TASK RESUME;

SHOW TASKS;

-- Important: Suspend tasks after testing to avoid unnecessary Snowflake credit usage
ALTER TASK RAW.REFRESH_MART_TASK SUSPEND;
ALTER TASK RAW.REFRESH_STAGING_TASK SUSPEND;
