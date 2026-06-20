-- 02_create_raw_table.sql
-- Create RAW table to store original mobile repair transaction data

USE DATABASE TECHY_PROJECT;
USE SCHEMA RAW;

CREATE OR REPLACE TABLE REPAIR_TRANSACTIONS
(
    transaction_date DATE,
    customer_name STRING,
    phone_model STRING,
    repair_type STRING,
    part_cost NUMBER(10,2),
    labor_cost NUMBER(10,2),
    total_amount NUMBER(10,2),
    payment_method STRING,
    technician STRING
);

SELECT COUNT(*) AS total_records
FROM RAW.REPAIR_TRANSACTIONS;
