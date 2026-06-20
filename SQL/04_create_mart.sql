-- 04_create_mart.sql
-- Create MART tables for reporting and dashboard analysis

USE DATABASE TECHY_PROJECT;

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

CREATE OR REPLACE TABLE MART.DASHBOARD_REPAIR_SUMMARY AS
SELECT
    repair_year,
    repair_month,
    month_name,
    phone_model,
    repair_type,
    technician,
    payment_method,
    COUNT(*) AS total_repairs,
    SUM(revenue) AS total_revenue,
    SUM(gross_profit) AS total_profit,
    ROUND(AVG(revenue),2) AS avg_repair_value
FROM MART.FACT_REPAIRS
GROUP BY
    repair_year,
    repair_month,
    month_name,
    phone_model,
    repair_type,
    technician,
    payment_method;

SELECT COUNT(*) AS total_fact_rows
FROM MART.FACT_REPAIRS;
