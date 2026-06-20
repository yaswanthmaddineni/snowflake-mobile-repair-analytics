-- 05_data_quality.sql
-- Create data quality report for repair transaction data

USE DATABASE TECHY_PROJECT;

CREATE OR REPLACE TABLE QUALITY.DATA_QUALITY_REPORT AS

SELECT
    'Missing Important Values' AS check_name,
    COUNT(*) AS failed_records
FROM MART.FACT_REPAIRS
WHERE transaction_date IS NULL
   OR customer_name IS NULL
   OR phone_model IS NULL
   OR repair_type IS NULL
   OR technician IS NULL
   OR revenue IS NULL

UNION ALL

SELECT
    'Negative or Zero Revenue' AS check_name,
    COUNT(*) AS failed_records
FROM MART.FACT_REPAIRS
WHERE revenue <= 0

UNION ALL

SELECT
    'Wrong Profit Calculation' AS check_name,
    COUNT(*) AS failed_records
FROM MART.FACT_REPAIRS
WHERE gross_profit <> revenue - part_cost

UNION ALL

SELECT
    'Duplicate Repair IDs' AS check_name,
    COUNT(*) AS failed_records
FROM (
    SELECT repair_id
    FROM MART.FACT_REPAIRS
    GROUP BY repair_id
    HAVING COUNT(*) > 1
);

SELECT *
FROM QUALITY.DATA_QUALITY_REPORT;
