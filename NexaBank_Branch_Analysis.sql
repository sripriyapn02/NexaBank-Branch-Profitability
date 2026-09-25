--NexaBank SQL Analysis File
    
-- Select the database
USE nexabank;


-- Check total number of records
SELECT COUNT(*) AS Total_Records
FROM branch_data;


-- View sample data
SELECT *
FROM branch_data
LIMIT 5;


-- Calculate total revenue, expenses and profit
SELECT
    ROUND(SUM(Interest_Income + Fee_Income), 2) AS Total_Revenue,
    ROUND(
        SUM(Employee_Cost + Rent_Expense + Other_Operating_Expense),
        2
    ) AS Total_Expenses,
    ROUND(
        SUM(Interest_Income + Fee_Income)
        - SUM(Employee_Cost + Rent_Expense + Other_Operating_Expense),
        2
    ) AS Total_Profit
FROM branch_data;


-- Calculate profit margin
SELECT
    ROUND(
        (
            SUM(Interest_Income + Fee_Income)
            - SUM(Employee_Cost + Rent_Expense + Other_Operating_Expense)
        ) / SUM(Interest_Income + Fee_Income) * 100,
        2
    ) AS Profit_Margin
FROM branch_data;


-- Calculate cost-to-income ratio
SELECT
    ROUND(
        SUM(Employee_Cost + Rent_Expense + Other_Operating_Expense)
        / SUM(Interest_Income + Fee_Income) * 100,
        2
    ) AS Cost_to_Income_Ratio
FROM branch_data;


-- Calculate total customers
SELECT
    SUM(Customers) AS Total_Customers
FROM branch_data;


-- Calculate total deposits and loans
SELECT
    ROUND(SUM(Deposits), 2) AS Total_Deposits,
    ROUND(SUM(Loans), 2) AS Total_Loans
FROM branch_data;


-- Calculate total loan defaults
SELECT
    SUM(Loan_Defaults) AS Total_Loan_Defaults
FROM branch_data;


-- Analyze branch-wise profit
SELECT
    Branch_ID,
    Branch_Name,
    ROUND(
        SUM(Interest_Income + Fee_Income)
        - SUM(Employee_Cost + Rent_Expense + Other_Operating_Expense),
        2
    ) AS Profit
FROM branch_data
GROUP BY Branch_ID, Branch_Name
ORDER BY Profit DESC;


-- Analyze region-wise profit
SELECT
    Region,
    ROUND(
        SUM(Interest_Income + Fee_Income)
        - SUM(Employee_Cost + Rent_Expense + Other_Operating_Expense),
        2
    ) AS Profit
FROM branch_data
GROUP BY Region
ORDER BY Profit DESC;


-- Analyze monthly profit
SELECT
    Month,
    ROUND(
        SUM(Interest_Income + Fee_Income)
        - SUM(Employee_Cost + Rent_Expense + Other_Operating_Expense),
        2
    ) AS Profit
FROM branch_data
GROUP BY Month
ORDER BY
    CASE Month
        WHEN 'January' THEN 1
        WHEN 'February' THEN 2
        WHEN 'March' THEN 3
        WHEN 'April' THEN 4
        WHEN 'May' THEN 5
        WHEN 'June' THEN 6
        WHEN 'July' THEN 7
        WHEN 'August' THEN 8
        WHEN 'September' THEN 9
        WHEN 'October' THEN 10
        WHEN 'November' THEN 11
        WHEN 'December' THEN 12
    END;


-- Find top 5 branches by customer count
SELECT
    Branch_ID,
    Branch_Name,
    SUM(Customers) AS Total_Customers
FROM branch_data
GROUP BY Branch_ID, Branch_Name
ORDER BY Total_Customers DESC
LIMIT 5;
