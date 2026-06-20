-- 03_create_staging.sql
-- Create staging table with cleaned and transformed repair data

USE DATABASE TECHY_PROJECT;

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

SELECT *
FROM STAGING.STG_REPAIRS
LIMIT 10;
