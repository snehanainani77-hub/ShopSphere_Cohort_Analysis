CREATE DATABASE cohort_analysis;
USE cohort_analysis;

-- 1. Checking if Data Was Imported Corectly
SELECT COUNT(*) AS total_records
FROM cohort_analysis_synthetic_dataset;
SELECT *
FROM cohort_analysis_synthetic_dataset
LIMIT 10;

-- 2. renaming the table 
RENAME TABLE cohort_analysis_synthetic_dataset
TO Cohort_Analysis;

-- 3. Checking Dates
SELECT
    MIN(STR_TO_DATE(signup_date, '%Y-%m-%d')) AS earliest_signup,
    MAX(STR_TO_DATE(signup_date, '%Y-%m-%d')) AS latest_signup
FROM cohort_analysis;

-- 4. Verifying Datatypes
DESCRIBE cohort_analysis;

-- 5. Checking For Invalid Dates
SELECT
    signup_date,
    cohort_month,
    activity_month
FROM cohort_analysis
LIMIT 10;

SELECT
    COUNT(*) AS total_records,
    SUM(
        STR_TO_DATE(signup_date, '%Y-%m-%d') IS NULL
    ) AS invalid_signup_dates,
    SUM(
        STR_TO_DATE(CONCAT(cohort_month, '-01'), '%Y-%m-%d') IS NULL
    ) AS invalid_cohort_months,
    SUM(
        STR_TO_DATE(CONCAT(activity_month, '-01'), '%Y-%m-%d') IS NULL
    ) AS invalid_activity_months
FROM cohort_analysis;
SELECT
    COUNT(*) AS total_records,
    SUM(
        months_since_signup <>
        TIMESTAMPDIFF(
            MONTH,
            STR_TO_DATE(CONCAT(cohort_month, '-01'), '%Y-%m-%d'),
            STR_TO_DATE(CONCAT(activity_month, '-01'), '%Y-%m-%d')
        )
    ) AS mismatched_records
FROM cohort_analysis;

-- 6. Checking For Duplicates
SELECT
    customer_id,
    activity_month,
    COUNT(*) AS record_count
FROM cohort_analysis
GROUP BY
    customer_id,
    activity_month
HAVING COUNT(*) > 1
ORDER BY record_count DESC;

-- 7. Checking For Missing Values
SELECT
    SUM(customer_id IS NULL) AS missing_customer_ids,
    SUM(signup_date IS NULL) AS missing_signup_dates,
    SUM(cohort_month IS NULL) AS missing_cohort_months,
    SUM(activity_month IS NULL) AS missing_activity_months,
    SUM(acquisition_channel IS NULL) AS missing_channels,
    SUM(plan_at_signup IS NULL) AS missing_plans
FROM cohort_analysis;

-- 8. Validating The Active Colunmn
SELECT
    active,
    COUNT(*) AS total_records
FROM cohort_analysis
GROUP BY active;

-- 9. Calculating Monthly Cohort Retention
SELECT
    cohort_month,
    months_since_signup,
    COUNT(DISTINCT customer_id) AS customers
FROM cohort_analysis
GROUP BY cohort_month, months_since_signup
ORDER BY cohort_month, months_since_signup;    

-- 10. Calculating the Retention Percentage
    SELECT
    cohort_month,
    months_since_signup,
    COUNT(DISTINCT customer_id) AS customers,
    ROUND(100.0 * COUNT(DISTINCT customer_id) /
        (SELECT COUNT(DISTINCT customer_id)
            FROM cohort_analysis c2
            WHERE c2.cohort_month = c1.cohort_month
              AND c2.months_since_signup = 0),2) AS retention_percentage
FROM cohort_analysis c1
GROUP BY cohort_month, months_since_signup
ORDER BY cohort_month, months_since_signup;

-- 11. Cohort Retention Matrix 
SELECT
    cohort_month,
    ROUND(100.0 * COUNT(DISTINCT CASE WHEN months_since_signup = 0 THEN customer_id END) /
        COUNT(DISTINCT CASE WHEN months_since_signup = 0 THEN customer_id END), 2) AS Month_0,
    ROUND(100.0 * COUNT(DISTINCT CASE WHEN months_since_signup = 1 THEN customer_id END) /
        COUNT(DISTINCT CASE WHEN months_since_signup = 0 THEN customer_id END), 2) AS Month_1,
    ROUND(100.0 * COUNT(DISTINCT CASE WHEN months_since_signup = 2 THEN customer_id END) /
        COUNT(DISTINCT CASE WHEN months_since_signup = 0 THEN customer_id END), 2) AS Month_2,
    ROUND(100.0 * COUNT(DISTINCT CASE WHEN months_since_signup = 3 THEN customer_id END) /
        COUNT(DISTINCT CASE WHEN months_since_signup = 0 THEN customer_id END), 2) AS Month_3
FROM cohort_analysis
GROUP BY cohort_month
ORDER BY cohort_month;

-- 12. Retention By Acquition Channel
SELECT
    acquisition_channel,
    COUNT(DISTINCT CASE WHEN months_since_signup = 0 THEN customer_id END) AS Month_0,
    COUNT(DISTINCT CASE WHEN months_since_signup = 1 THEN customer_id END) AS Month_1,
    ROUND(
        100.0 * COUNT(DISTINCT CASE WHEN months_since_signup = 1 THEN customer_id END) /
        COUNT(DISTINCT CASE WHEN months_since_signup = 0 THEN customer_id END),2) AS Month_1_retention
FROM cohort_analysis
GROUP BY acquisition_channel
ORDER BY Month_1_retention DESC;

-- 13. Revenue, Orders and Customers by Acquisition Channel
SELECT
    acquisition_channel,
    COUNT(DISTINCT customer_id) AS total_customers,
    SUM(orders) AS total_orders,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM cohort_analysis
GROUP BY acquisition_channel
ORDER BY total_revenue DESC;

-- 14. Revenue Per Customer By Acquistion Channel
SELECT
    acquisition_channel,
    COUNT(DISTINCT customer_id) AS total_customers,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(revenue) / COUNT(DISTINCT customer_id), 2) AS revenue_per_customer
FROM cohort_analysis
GROUP BY acquisition_channel
ORDER BY revenue_per_customer DESC;

-- 15. Analysing Consumer Retntion By Subscription Plan
SELECT
    plan_at_signup,
    COUNT(DISTINCT CASE WHEN months_since_signup = 0 THEN customer_id END) AS Month_0,
    COUNT(DISTINCT CASE WHEN months_since_signup = 1 THEN customer_id END) AS Month_1,
    ROUND(100.0 * COUNT(DISTINCT CASE WHEN months_since_signup = 1 THEN customer_id END) /
        COUNT(DISTINCT CASE WHEN months_since_signup = 0 THEN customer_id END),2) AS Month_1_retention
FROM cohort_analysis
GROUP BY plan_at_signup
ORDER BY Month_1_retention DESC;

-- 16. Monthly Revenue Trend
SELECT
    months_since_signup,
    COUNT(DISTINCT customer_id) AS active_customers,
    SUM(orders) AS total_orders,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(revenue) / NULLIF(COUNT(DISTINCT customer_id), 0),2) AS revenue_per_customer
FROM cohort_analysis
GROUP BY months_since_signup
ORDER BY months_since_signup;

-- 17.Compairing Revenue By Sign up Cohort
SELECT
    cohort_month,
    months_since_signup,
    COUNT(DISTINCT customer_id) AS observed_customers,
    SUM(orders) AS total_orders,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(revenue) /
        NULLIF(COUNT(DISTINCT customer_id), 0),2) AS revenue_per_customer
FROM cohort_analysis
GROUP BY
    cohort_month,
    months_since_signup
ORDER BY
    cohort_month,
    months_since_signup; 
