ShopSpree — Customer Cohort & Revenue Analysis

Project Overview

ShopSpree is a portfolio project exploring customer activity, revenue trends, cohort behavior, and acquisition-channel performance using a synthetic e-commerce dataset.

The project uses SQL for data validation and analysis and Power BI to build an interactive dashboard.

Objectives

- Analyze customer activity by signup cohort and months since signup.
- Track revenue and orders over time.
- Compare customer counts and recorded revenue across acquisition channels.
- Calculate revenue per distinct customer.
- Present findings through an interactive Power BI dashboard.

Tools Used

- SQL / MySQL — data validation and analytical queries
- Microsoft Power BI — dashboard development and visualization
- CSV — source dataset

Dataset

The dataset contains customer identifiers, signup and activity dates, cohort month, months since signup, acquisition channel, subscription plan, country, activity indicators, sessions, orders, and revenue.

The dataset is intended for portfolio analysis. Confirm that the data is synthetic or approved for public distribution before publishing it.

Dashboard

The dashboard includes:

- Total customers, revenue, and orders
- Monthly revenue by months since signup
- Customers by acquisition channel
- Revenue by acquisition channel
- Revenue per customer by acquisition channel
- Cohort activity percentage matrix
- Filters for cohort month, acquisition channel, and subscription plan

Methodology and Limitations

Customer counts are calculated using distinct customer identifiers. Revenue and order totals are aggregated from activity records.

The cohort matrix measures observed activity relative to the customers observed in Month 0. It should not be interpreted as definitive customer retention or churn unless the dataset's missing customer-month records are understood.

Revenue aggregation assumes that revenue values represent activity-period amounts rather than cumulative totals repeated across rows.

Repository Structure

- "dashboard/" — Power BI report and screenshots
- "data/" — shareable source dataset
- "sql/" — analysis and validation queries
- "assets/" — logo and dashboard graphics

Future Improvements

- Add cohort-level revenue comparisons.
- Investigate differences in customer activity across acquisition channels.
- Improve dashboard accessibility and visual formatting.
- Document validation checks and key analytical findings.

Disclaimer

ShopSpree is a fictional brand used for this portfolio project. Results describe the provided dataset and should not be treated as real business performance.
