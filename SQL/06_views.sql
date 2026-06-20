-- 06_views.sql
-- Create reporting views for Power BI dashboard

USE DATABASE TECHY_PROJECT;

CREATE OR REPLACE VIEW MART.V_EXECUTIVE_KPI AS
SELECT
    COUNT(*) AS total_repairs,
    SUM(revenue) AS total_revenue,
    SUM(gross_profit) AS total_profit,
    ROUND(AVG(revenue),2) AS avg_repair_value
FROM MART.FACT_REPAIRS;

CREATE OR REPLACE VIEW MART.V_TECHNICIAN_PERFORMANCE AS
SELECT
    technician,
    COUNT(*) AS repairs_completed,
    SUM(revenue) AS total_revenue,
    SUM(gross_profit) AS total_profit,
    ROUND(AVG(revenue),2) AS avg_repair_value
FROM MART.FACT_REPAIRS
GROUP BY technician;

CREATE OR REPLACE VIEW MART.V_MONTHLY_REVENUE AS
SELECT
    repair_year,
    repair_month,
    month_name,
    COUNT(*) AS total_repairs,
    SUM(revenue) AS total_revenue,
    SUM(gross_profit) AS total_profit
FROM MART.FACT_REPAIRS
GROUP BY repair_year, repair_month, month_name;

CREATE OR REPLACE VIEW MART.V_REPAIR_TYPE_ANALYSIS AS
SELECT
    repair_type,
    COUNT(*) AS total_repairs,
    SUM(revenue) AS total_revenue,
    SUM(gross_profit) AS total_profit,
    ROUND(AVG(revenue),2) AS avg_repair_value
FROM MART.FACT_REPAIRS
GROUP BY repair_type;

CREATE OR REPLACE VIEW MART.V_DASHBOARD_FINAL AS
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
    revenue,
    gross_profit,
    part_cost,
    labor_cost
FROM MART.FACT_REPAIRS;

SHOW VIEWS IN SCHEMA MART;
