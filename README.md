# Snowflake Mobile Repair Analytics Project

## Project Overview

This project is an end-to-end data analytics solution built using Snowflake and Power BI.

The project analyzes 500 mobile repair transactions for a fictional mobile repair store called Techy. The goal of this project is to demonstrate real-world data warehouse development, SQL transformation, data quality checks, automation, and dashboard reporting.

## Tools Used

* Snowflake
* SQL
* Power BI
* GitHub

## Project Architecture

CSV File
↓
RAW Layer
↓
STAGING Layer
↓
MART Layer
↓
QUALITY Layer
↓
Power BI Dashboard

## Snowflake Layers

### RAW Layer

Stores the original uploaded CSV data.

Table:

* RAW.REPAIR_TRANSACTIONS

### STAGING Layer

Cleans and transforms raw repair transaction data.

Table:

* STAGING.STG_REPAIRS

Transformations added:

* repair_id
* repair_year
* repair_month
* month_name
* gross_profit
* loaded_at timestamp

### MART Layer

Stores reporting-ready data for analytics and dashboards.

Tables:

* MART.FACT_REPAIRS
* MART.DASHBOARD_REPAIR_SUMMARY

Views:

* MART.V_EXECUTIVE_KPI
* MART.V_TECHNICIAN_PERFORMANCE
* MART.V_MONTHLY_REVENUE
* MART.V_REPAIR_TYPE_ANALYSIS
* MART.V_DASHBOARD_FINAL

### QUALITY Layer

Stores data quality validation results.

Table:

* QUALITY.DATA_QUALITY_REPORT

Checks included:

* Missing values
* Negative or zero revenue
* Wrong profit calculation
* Duplicate repair IDs

## Snowflake Features Used

* Databases
* Schemas
* Tables
* Views
* Streams
* Tasks
* SQL transformations
* Data quality checks
* Reporting views

## Power BI Dashboard

The dashboard includes:

* Total Revenue
* Total Profit
* Total Repairs
* Average Repair Value
* Technician Performance
* Repair Type Analysis
* Monthly Revenue Trend
* Phone Model Analysis

## Business Questions Answered

* How much revenue did the business generate?
* Which technician generated the most profit?
* Which repair type generated the most revenue?
* Which phone model was repaired the most?
* What is the monthly revenue trend?
* Are there any data quality issues?

## Repository Structure

snowflake-mobile-repair-analytics
├── SQL
│   ├── 01_create_database.sql
│   ├── 02_create_raw_table.sql
│   ├── 03_create_staging.sql
│   ├── 04_create_mart.sql
│   ├── 05_data_quality.sql
│   ├── 06_views.sql
│   ├── 07_streams.sql
│   └── 08_tasks.sql
├── Dashboard
├── Screenshots
├── Documentation
└── README.md

## Author
Yaswanth Maddineni
