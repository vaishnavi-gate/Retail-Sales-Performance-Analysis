# Retail Sales Performance & Customer Analysis

An end-to-end data analytics portfolio project using the Sample
Superstore dataset to explore retail sales, profitability, regional
performance, products, and customers.

## Project Overview

This project applies a practical data analytics workflow using Excel,
Python, SQL, and Power BI:

1.  Explore and validate the dataset.
2.  Clean and prepare the data.
3.  Perform exploratory data analysis (EDA).
4.  Analyse customers and prepare an RFM dataset.
5.  Query the data using Google BigQuery.
6.  Build interactive Power BI dashboards.
7.  Prepare evidence-based business insights and recommendations.

## Dataset

-   **Dataset:** Sample Superstore Dataset -- Final
-   **Source:** [Kaggle -- Superstore Dataset
    Final](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)
-   **Data type:** Retail order-line transactions

The dataset includes order and shipping dates, customer details, region,
product category and sub-category, sales, quantity, discount, and
profit. Column names may vary slightly depending on the downloaded
version.

Check the original Kaggle page for licensing and usage terms before
redistributing the dataset.

## Tools & Technologies

  Tool                   Purpose
  ---------------------- ------------------------------------------------------
  Microsoft Excel        Data exploration, validation, and PivotTables
  Python                 Data cleaning, EDA, and customer analysis
  Pandas and NumPy       Data manipulation and numerical analysis
  Matplotlib / Seaborn   Data visualisation
  Google Colab           Python notebook environment
  Google BigQuery        SQL-based analysis
  SQL                    Aggregations, subqueries, CTEs, and window functions
  Microsoft Power BI     Interactive dashboards

## Project Workflow

### 1. Excel -- Data Exploration

-   Checked dataset dimensions and column types.
-   Reviewed missing values and duplicate records.
-   Checked date and numeric formats.
-   Used PivotTables to explore sales and profit.
-   Compared performance across regions, categories, and customer
    segments.

### 2. Python -- Data Cleaning and Preparation

-   Loaded and inspected the dataset using Pandas.
-   Reviewed data types, missing values, duplicates, and consistency.
-   Prepared a cleaned dataset for analysis.
-   Exported the cleaned data as `Superstore_Cleaned.csv`.

### 3. Python -- Exploratory Data Analysis

Explored sales and profit patterns, regional performance, category and
product performance, customer and order trends, and discount and
shipping patterns.

### 4. Customer Analysis and RFM

Prepared a customer-level RFM analysis dataset.

-   **Recency:** How recently a customer placed an order.
-   **Frequency:** How often a customer placed orders.
-   **Monetary:** How much a customer spent.

Exported the prepared customer analysis as
`Superstore_RFM_Analysis.csv`.

### 5. SQL -- Google BigQuery

Uploaded the cleaned data to BigQuery and performed analysis covering: -
Data exploration and summary statistics. - Sales and profit. - Regions,
products, and customers. - Date-based trends. - Discounts and
shipping. - `CASE` expressions, subqueries, CTEs, and window functions.

**BigQuery table:** `retail_analysis.superstore`

The SQL queries are saved as `Superstore SQL Analysis`. Add the exported
`.sql` file to the repository when available.

### 6. Power BI -- Interactive Dashboard

The report is planned to contain three pages:

  -----------------------------------------------------------------------
  Page                                Planned analysis
  ----------------------------------- -----------------------------------
  Sales Overview                      KPI cards, monthly sales trend,
                                      sales by region, category
                                      performance, and slicers

  Product Analysis                    Category and sub-category
                                      performance, top products, and
                                      discount impact

  Customer Analysis                   Customer totals, sales by segment,
                                      top customers, and RFM segments
  -----------------------------------------------------------------------

The Sales Overview page currently includes these KPI measures:

-   Total Sales
-   Total Profit
-   Total Orders
-   Total Customers
-   Profit Margin

#### DAX Measures

``` dax
Total Sales = SUM(superstore[Sales])

Total Profit = SUM(superstore[Profit])

Total Orders = DISTINCTCOUNT(superstore[Order ID])

Total Customers = DISTINCTCOUNT(superstore[Customer ID])

Profit Margin =
DIVIDE([Total Profit], [Total Sales], 0)
```

Format Profit Margin as a percentage and apply suitable currency
formatting to sales and profit.

**Status note:** Dashboard development and validation are still in
progress. Do not treat the planned pages and visuals as completed until
the final Power BI report is uploaded.

## Repository Structure

Suggested structure (include only files that actually exist):

``` text
Retail-Sales-Performance-Analysis/
├── README.md
├── data/
│   ├── Superstore_Cleaned.csv
│   └── Superstore_RFM_Analysis.csv
├── notebooks/
│   ├── Superstore_Data_Cleaning.ipynb
│   ├── Superstore_EDA.ipynb
│   └── Customer_RFM_Analysis.ipynb
├── sql/
│   └── Superstore_SQL_Analysis.sql
├── powerbi/
│   └── Retail_Sales_Performance_Analysis.pbix
└── reports/
    └── Retail_Sales_Analysis_Report.pdf
```

This is a suggested structure, not a claim that every file has already
been created. If the dataset is large or its licence does not allow
redistribution, do not upload it; provide the Kaggle source link
instead.

## Business Questions

1.  What are the overall sales, profit, order, and customer totals?
2.  How do sales and profit vary across regions?
3.  Which categories and sub-categories perform best?
4.  Which products generate the highest sales?
5.  How do discounts relate to profitability?
6.  How do sales change over time?
7.  Which customer segments contribute most to sales?
8.  What customer groups can be identified through RFM analysis?

## Business Insights and Recommendations

Add this section after validating the final analysis. For each insight,
include: - **Finding:** The observed pattern. - **Evidence:** The
relevant metric, chart, or SQL result. - **Recommendation:** A practical
action supported by the evidence.

Avoid presenting assumptions as findings.

## How to Explore the Project

1.  Obtain the dataset from the Kaggle source above.
2.  Open the notebooks in Google Colab or Jupyter Notebook.
3.  Load the dataset into BigQuery and run the SQL file.
4.  Open the `.pbix` file in Power BI Desktop to explore the report.
5.  Review the final PDF report once it is added.

## Project Status

-   [x] Excel data exploration
-   [x] Python data cleaning and preparation
-   [x] Python exploratory data analysis
-   [x] Customer / RFM analysis
-   [x] SQL analysis in BigQuery
-   [ ] Complete and validate the Sales Overview dashboard
-   [ ] Build the Product Analysis dashboard
-   [ ] Build the Customer Analysis dashboard
-   [ ] Finalise business insights and recommendations
-   [ ] Prepare the final project report
-   [ ] Upload and verify project files on GitHub

## Author

**Vaishnavi Gate**\
B.Tech -- Electronics & Telecommunication Engineering\
Aspiring Data Analyst

------------------------------------------------------------------------

*Created as a data analytics portfolio project to practise Excel,
Python, SQL, and Power BI using a retail dataset.*
