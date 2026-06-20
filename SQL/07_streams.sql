-- 07_streams.sql
-- Create Snowflake Stream to track new repair transactions

USE DATABASE TECHY_PROJECT;
USE SCHEMA RAW;

CREATE OR REPLACE STREAM REPAIR_STREAM
ON TABLE REPAIR_TRANSACTIONS;

SHOW STREAMS;

-- Check stream data
SELECT *
FROM REPAIR_STREAM;

-- Example test insert to verify stream capture
INSERT INTO RAW.REPAIR_TRANSACTIONS
(
    transaction_date,
    customer_name,
    phone_model,
    repair_type,
    part_cost,
    labor_cost,
    total_amount,
    payment_method,
    technician
)
VALUES
(
    CURRENT_DATE(),
    'Test Customer',
    'iPhone',
    'Battery',
    45,
    30,
    75,
    'Card',
    'tony'
);

-- Check stream after inserting new row
SELECT *
FROM REPAIR_STREAM;
