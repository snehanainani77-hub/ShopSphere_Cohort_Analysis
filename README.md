ShopSpree — Customer Cohort & Retention Analysis

"ShopSpree Logo" (assets/shopspree-logo.png)

An end-to-end data analytics portfolio project using SQL and Power BI to explore customer retention, cohort behaviour, revenue, orders, and acquisition-channel performance.

Dashboard Preview

"ShopSpree Cohort Analysis Dashboard" (assets/dashboard-preview.jpg)

Power BI dashboard showing customer and revenue KPIs, acquisition-channel comparisons, monthly revenue trends, and cohort retention.

Project Overview

ShopSpree is a fictional subscription-commerce business. This project analyses how customer activity and revenue change after signup and how outcomes differ across acquisition channels and signup plans.

The project combines SQL-based data validation and cohort calculations with a Power BI dashboard to communicate the results.

Note: The dataset is synthetic and created for portfolio practice. It does not contain real ShopSpree customer data.

Business Questions

- How many customers are represented in each signup-month cohort?
- What percentage of each cohort remains active in subsequent months?
- How do customer activity and retention change over time?
- Which acquisition channels contribute the most revenue and orders?
- How does revenue per customer vary by acquisition channel?
- How can cohort patterns inform customer-retention and acquisition strategies?

Tools & Technologies

- SQL (PostgreSQL): Data validation, cohort sizing, retention calculations, revenue aggregation, and channel comparisons.
- Power BI: KPI cards, trend charts, channel comparisons, slicers, and cohort-retention heatmaps.
- CSV: Dataset storage and data preparation.
- Data Analytics: Exploratory analysis, metric interpretation, and business recommendations.

Dashboard Highlights

The Power BI dashboard includes:

- KPI cards: Total customers, total revenue, and total orders.
- Monthly revenue analysis: Revenue trends across months since signup.
- Customer acquisition analysis: Customer comparisons across acquisition channels.
- Revenue by channel: Identifying channels contributing to total revenue.
- Revenue per customer: Comparing revenue performance across channels.
- Cohort-retention heatmap: Analysing customer activity across signup cohorts and months since signup.
- Interactive filters: Cohort month, acquisition channel, and subscription plan.

The figures shown in the dashboard are based on the synthetic dataset and should not be interpreted as real business performance.

Repository Structure

ShopSpree-Cohort-Analysis/
├── README.md
├── assets/
│   ├── dashboard-preview.jpg
│   └── shopspree-logo.png
├── data/
│   └── cohort_analysis_synthetic_dataset.csv
└── sql/
    └── cohort_analysis.sql

The Power BI ".pbix" file can be added separately to allow users to download and interact with the report.

Dataset Description

The dataset contains one row per customer per calendar month in which activity was recorded. It is an activity-only dataset, not a complete customer-by-month panel.

Column| Description
"customer_id"| Synthetic customer identifier
"signup_date"| Customer signup date
"cohort_month"| Calendar month of signup
"activity_month"| Calendar month with recorded activity
"months_since_signup"| Number of calendar months since signup
"acquisition_channel"| Customer acquisition source
"plan_at_signup"| Subscription plan recorded at signup
"country"| Synthetic country value
"active"| Activity indicator
"sessions"| Sessions recorded during the month
"orders"| Orders recorded during the month
"revenue"| Revenue recorded during the month in fictional currency units

Acquisition Channels

The dataset includes the following acquisition channels:

- Organic
- Google Ads
- Meta Ads
- Referral
- Email

Methodology

1. Data Validation

SQL queries are used to examine row counts, missing key fields, duplicate customer-month records, and consistency between cohort month, activity month, and months since signup.

2. Cohort Identification

Customers are grouped according to their signup month. The cohort size is calculated using distinct customers observed at month zero.

3. Retention Analysis

Retention is calculated by dividing the number of distinct customers active at a given cohort age by the original number of customers in that cohort.

Retention Rate = Active Customers at Month N / Original Cohort Size × 100

4. Revenue Analysis

Revenue and orders are aggregated by cohort month and months since signup to examine how customer value changes over time.

5. Acquisition Channel Comparison

Acquisition channels are compared using customer activity, retention, revenue, and revenue per original cohort customer.

6. Dashboard Development

The analytical results are presented through Power BI KPI cards, comparison charts, lifecycle trends, interactive filters, and a cohort-retention heatmap.

Key Analytical Considerations

- The dataset is synthetic and intended for learning and portfolio demonstration.
- Missing customer-month records indicate that activity was not recorded for that customer in that month. They should not automatically be treated as data-quality errors.
- Retention denominators must use the original cohort size from month zero.
- Revenue and order totals reflect the supplied synthetic records.
- Channel comparisons are descriptive and do not establish causation.
- The SQL script uses PostgreSQL syntax; other database systems may require modifications.

How to Use This Project

1. Clone or download this repository.
2. Create a PostgreSQL database.
3. Import "data/cohort_analysis_synthetic_dataset.csv" into a table named "cohort_activity".
4. Verify that column names and data types match the dataset structure.
5. Run the SQL queries in "sql/cohort_analysis.sql".
6. Review the validation results before interpreting the analytical outputs.
7. Open the Power BI report, if included, and refresh the data and visuals as required.

Potential Improvements

- Add an executive summary highlighting the most important findings.
- Compare month-one and month-three retention across acquisition channels.
- Add automated data-quality checks.
- Include a reproducible database import script.
- Publish the editable Power BI report.
- Develop recommendations and experiments based on observed cohort patterns.

Project Files

- "SQL Analysis" (sql/cohort_analysis.sql)
- "Synthetic Dataset" (data/cohort_analysis_synthetic_dataset.csv)
- "Dashboard Preview" (assets/dashboard-preview.jpg)
- "ShopSpree Logo" (assets/shopspree-logo.png)

---

Author: Your Name
Project Type: Data Analytics Portfolio Project
Tools: PostgreSQL | Power BI | CSV
