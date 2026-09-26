# NexaBank Branch Profitability Analysis

## Project Overview

This project analyzes the performance and profitability of NexaBank branches using **SQL and Excel**.

The main goal is to understand branch performance, income, expenses, customers, deposits, loans, and loan defaults. The analysis helps identify differences between branches and regions and provides useful business insights.

## Project Objective

The objective of this project is to analyze NexaBank branch-level data and understand branch profitability, income, expenses, deposits, loans, customers, and loan defaults. The analysis helps compare branch and regional performance and identify areas that can support better business decisions.

## Tools Used

* SQL (MySQL)
* Microsoft Excel
* CSV

## Dataset

The dataset contains **240 records** of NexaBank branch-level data.

### Main Columns

* Branch_ID
* Branch_Name
* City
* Region
* Branch_Type
* Customers
* Deposits
* Loans
* Interest_Income
* Fee_Income
* Employee_Cost
* Rent_Expense
* Other_Operating_Expense
* Loan_Defaults
* Month
* Year

## Business Questions

The project focuses on questions such as:

* Which branches are performing well?
* Which branches are more profitable?
* How does branch performance vary by region?
* How much income is generated from interest and fees?
* What are the major operating expenses?
* Which branches have higher deposits and loans?
* How do loan defaults vary between branches?
* How does branch performance change over time?

## Project Structure

```text
NexaBank Branch Profitability Analysis
│
├── data
│   └── NexaBank_Branch_Profitability_Dataset - Copy.csv
│
├── sql
│   └── NexaBank_Branch_Analysis.sql
│
├── excel
│   └── NexaBank_Branch_Profitability_Dataset.xlsx
│
├── images
│   ├── Profit by Region.png
│   ├── Monthly Profit Trend.png
│   └── Branch-wise Profitability.png
│
└── README.md
```

## SQL Analysis

SQL was used to:

* Explore the branch data
* Calculate total income and expenses
* Analyze branch profitability
* Compare branch and regional performance
* Analyze customers, deposits, and loans
* Examine loan defaults
* Identify useful business insights

## Excel Analysis

Excel was used to:

* Analyze the dataset
* Create pivot tables
* Compare branch and regional performance
* Analyze income and expenses
* Study profitability
* Create KPI cards
* Create visual reports for better understanding

## How to Run

### SQL

1. Open MySQL.
2. Create or select the NexaBank database.
3. Import the CSV dataset into the required table.
4. Open the SQL file from the `sql` folder.
5. Run the queries to perform the analysis.

### Excel

1. Open the Excel file from the `excel` folder.
2. Review the dataset and pivot tables.
3. Review the KPI cards and charts.
4. Use the available reports and analysis to understand branch performance.

## Visualizations

### 1. Profit by Region

![Profit by Region](images/Profit%20by%20Region.png)

**Insight:** This chart compares profitability across different regions and helps identify regional differences in branch performance.

### 2. Monthly Profit Trend

![Monthly Profit Trend](images/Monthly%20Profit%20Trend.png)

**Insight:** This chart shows how profit changes month by month and helps understand profitability trends over time.

### 3. Branch-wise Profitability

![Branch-wise Profitability](images/Branch-wise%20Profitability.png)

**Insight:** This chart compares profitability across individual branches and helps identify differences in branch performance.

## Important SQL Code Snippets

### Total Income

```sql
SELECT
    SUM(Interest_Income + Fee_Income) AS Total_Income
FROM branch_data;
```

### Branch Performance

```sql
SELECT
    Branch_Name,
    Customers,
    Deposits,
    Loans
FROM branch_data
ORDER BY Customers DESC;
```

These examples show how SQL was used to calculate important metrics and compare branch-level performance.

## Project Files

* `sql/NexaBank_Branch_Analysis.sql` – SQL queries used for data analysis
* `data/NexaBank_Branch_Profitability_Dataset - Copy.csv` – Project dataset in CSV format
* `excel/NexaBank_Branch_Profitability_Dataset.xlsx` – Excel file used for analysis
* `images/` – Important analysis visuals
* `README.md` – Project documentation

## Conclusion

This project provides a business-focused view of NexaBank branch performance and profitability.

By using SQL and Excel together, the analysis helps understand branch-level performance, income, expenses, deposits, loans, and defaults and supports data-driven business decisions.

## Future Scope

* Add more branch data for a longer period.
* Build a Power BI dashboard to monitor branch performance.
* Analyze profitability trends over time.
* Add more detailed loan default analysis.
* Develop forecasting models to support future branch planning.
