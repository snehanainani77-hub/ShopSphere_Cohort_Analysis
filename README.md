# ShopSpree — Customer Cohort & Retention Analysis

An end-to-end data analytics portfolio project using **SQL, Power BI, and Excel** to explore customer retention, cohort behavior, revenue trends, purchasing activity, and acquisition-channel performance.

## 📊 Dashboard Preview

![ShopSpree Cohort Analysis Dashboard](ShopSphere_Cohort_Analysis_Dashboard.png)

The Power BI dashboard provides an overview of customer and revenue KPIs, monthly revenue trends, acquisition-channel performance, revenue per customer, and cohort retention.

## 📌 Project Overview

**ShopSpree** is a fictional subscription-commerce business. This project analyzes how customer activity and revenue change after signup and how performance varies across acquisition channels and subscription plans.

The project combines SQL-based data validation, cohort identification, retention calculations, and revenue analysis with an interactive Power BI dashboard to communicate analytical findings.

> **Note:** The dataset is synthetic and created for portfolio practice. It does not contain real ShopSpree customer data.

## 🎯 Business Objectives

- Analyze customer retention across signup-month cohorts.
- Understand how customer activity changes over time.
- Compare retention patterns across different cohorts.
- Identify acquisition channels contributing to revenue and orders.
- Evaluate revenue per customer across acquisition channels.
- Explore differences in customer behavior across subscription plans.
- Generate insights that can support customer-retention and acquisition strategies.

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| **SQL (MySQL)** | Data validation, cohort sizing, retention calculations, revenue aggregation, and channel comparisons |
| **Power BI** | KPI cards, trend charts, channel comparisons, interactive slicers, and cohort-retention heatmaps |
| **Excel** | Supporting data inspection and analysis, where applicable |
| **CSV** | Dataset storage and data import |
| **GitHub** | Project documentation and version control |

## 📊 Dashboard Highlights

The Power BI dashboard includes the following visualizations and interactive features.

### Key Performance Indicators (KPIs)

- **Total Customers:** 10K
- **Total Revenue:** ₹45.04M
- **Total Orders:** 33K

### Monthly Revenue Analysis

Visualizes revenue trends across months since signup to explore how customer revenue changes over time.

### Customer Acquisition Analysis

Compares customer counts across acquisition channels, including Organic, Google Ads, Meta Ads, Referral, and Email.

### Revenue by Acquisition Channel

Highlights the revenue contribution of different acquisition channels.

### Revenue per Customer

Compares revenue per customer across acquisition channels to understand differences in revenue performance.

### Cohort Retention Heatmap

Displays customer retention across signup-month cohorts and months since signup, helping identify changes in customer activity over time.

### Interactive Filters

The dashboard includes slicers for:

- **Cohort Month**
- **Acquisition Channel**
- **Subscription Plan**

> The KPI values and visualizations reflect the synthetic dataset used in this project. They should not be interpreted as real business performance.

## 📂 Repository Structure

```text
ShopSpree-Cohort-Analysis/
│
├── README.md
├── cohort_Analysis_synthetic_dataset.csv
├── ShopSphere_Cohort_Analysis.sql
├── ShopSphere_Cohort_Analysis_Dashboard.png
└── Cohort_Analysis_Dashboard.pbix
```

## 🗃️ Dataset Description

The project uses a synthetic e-commerce dataset designed for cohort and retention analysis.

The dataset contains one row per customer per calendar month in which activity was recorded. It is an activity-only dataset rather than a complete customer-by-month panel.

| Column | Description |
|---|---|
| `customer_id` | Synthetic customer identifier |
| `signup_date` | Customer signup date |
| `cohort_month` | Calendar month of signup |
| `activity_month` | Calendar month in which activity was recorded |
| `months_since_signup` | Number of calendar months since signup |
| `acquisition_channel` | Customer acquisition source |
| `plan_at_signup` | Subscription plan recorded at signup |
| `country` | Synthetic country value |
| `active` | Customer activity indicator |
| `sessions` | Sessions recorded during the month |
| `orders` | Orders recorded during the month |
| `revenue` | Revenue recorded during the month in fictional currency units |

### Acquisition Channels

The dataset includes the following acquisition channels:

- Organic
- Google Ads
- Meta Ads
- Referral
- Email

## 🔍 Methodology

### 1. Data Validation

SQL queries are used to examine row counts, missing key fields, duplicate customer-month records, and consistency between cohort month, activity month, and months since signup.

### 2. Cohort Identification

Customers are grouped according to their signup month. Cohort size is calculated using distinct customers in the original cohort at month zero.

### 3. Customer Retention Analysis

Retention is calculated by dividing the number of distinct customers active in a given cohort period by the original cohort size.

**Retention Rate Formula**

\[
\text{Retention Rate (\%)} =
\frac{\text{Active Customers at Month N}}
{\text{Original Cohort Size}}
\times 100
\]

### 4. Revenue Analysis

Revenue and orders are aggregated across cohorts and months since signup to examine how purchasing activity and revenue change over time.

### 5. Acquisition Channel Comparison

Acquisition channels are compared using customer activity, retention, revenue, and revenue per customer.

### 6. Power BI Dashboard Development

The analytical results are presented through KPI cards, comparison charts, monthly revenue trends, interactive filters, and a cohort-retention heatmap.

## ⚠️ Key Analytical Considerations

- **Synthetic data:** The dataset is intended for learning and portfolio demonstration.
- **Activity-only records:** Missing customer-month records indicate that activity was not recorded for that customer in that month. They should not automatically be treated as data-quality errors.
- **Retention denominator:** Retention calculations must use the original cohort size from month zero.
- **Revenue and orders:** Aggregate values reflect the supplied synthetic records.
- **Descriptive analysis:** Differences between acquisition channels do not establish causation.
- **SQL compatibility:** The SQL script uses PostgreSQL syntax. Other database systems may require modifications.

## 🚀 How to Use This Project

1. Clone or download this repository.
2. Create a PostgreSQL database.
3. Import `cohort_Analysis_synthetic_dataset.csv` into a table named `cohort_activity`.
4. Verify that the column names and data types match the dataset structure.
5. Open `ShopSphere_Cohort_Analysis.sql` and execute the SQL queries.
6. Review the data-validation results before interpreting the analysis.
7. Open `Cohort_Analysis_Dashboard.pbix` in Power BI Desktop.
8. Configure the data source and refresh the report if required.
9. Explore the dashboard using the available filters and visualizations.

## 💡 Potential Improvements

- Add an executive summary highlighting the most important analytical findings.
- Compare month-one and month-three retention across acquisition channels.
- Introduce automated data-quality checks.
- Include a reproducible database-import script.
- Add further customer lifecycle and purchasing behavior analysis.
- Develop actionable recommendations based on observed cohort patterns.

## 📁 Project Deliverables

- **Synthetic Dataset:** Customer signup, activity, order, and revenue data.
- **SQL Analysis:** Data validation, cohort calculations, retention analysis, and revenue comparisons.
- **Power BI Dashboard:** Interactive visualizations of customer, revenue, and cohort metrics.
- **Dashboard Preview:** Screenshot of the completed Power BI report.
- **Documentation:** Project objectives, dataset description, methodology, and analytical considerations.

## 👩‍💻 Author

**Sneha Nainani**

Aspiring Data Analyst | SQL | Power BI | Excel | Data Visualization

---

*This project was developed for analytical learning and portfolio demonstration. All customer data is synthetic, and the results should be interpreted within the context of the dataset and implemented analysis.*
