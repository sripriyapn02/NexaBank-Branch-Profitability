-- NexaBank SQL Analysis File


-- =====================================================
-- STEP 1: Create the database
-- =====================================================

CREATE DATABASE IF NOT EXISTS nexabank;


-- =====================================================
-- STEP 2: Select the database
-- =====================================================

USE nexabank;


-- =====================================================
-- STEP 3: Create the branch_data table
-- =====================================================

CREATE TABLE IF NOT EXISTS branch_data (
    Branch_ID INT,
    Branch_Name VARCHAR(100),
    City VARCHAR(100),
    Region VARCHAR(50),
    Branch_Type VARCHAR(50),
    Customers INT,
    Deposits DECIMAL(15,2),
    Loans DECIMAL(15,2),
    Interest_Income DECIMAL(15,2),
    Fee_Income DECIMAL(15,2),
    Employee_Cost DECIMAL(15,2),
    Rent_Expense DECIMAL(15,2),
    Other_Operating_Expense DECIMAL(15,2),
    Loan_Defaults INT,
    Month VARCHAR(20),
    Year INT
);


-- =====================================================
-- STEP 4: Load the CSV dataset
-- =====================================================

-- Update the file path according to the location
-- of your CSV file on your computer.

LOAD DATA LOCAL INFILE 'path/to/NexaBank_Branch_Profitability_Dataset.csv'
INTO TABLE branch_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- =====================================================
-- STEP 5: Check total number of records
-- =====================================================

SELECT COUNT(*) AS Total_Records
FROM branch_data;


-- =====================================================
-- STEP 6: View sample data
-- =====================================================

SELECT *
FROM branch_data
LIMIT 5;


-- =====================================================
-- STEP 7: Check table structure
-- =====================================================

DESCRIBE branch_data;


-- =====================================================
-- STEP 8: Calculate total revenue, expenses and profit
-- =====================================================

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


-- =====================================================
-- STEP 9: Calculate profit margin
-- =====================================================

SELECT
    ROUND(
        (
            SUM(Interest_Income + Fee_Income)
            - SUM(Employee_Cost + Rent_Expense + Other_Operating_Expense)
        ) / SUM(Interest_Income + Fee_Income) * 100,
        2
    ) AS Profit_Margin

FROM branch_data;


-- =====================================================
-- STEP 10: Calculate cost-to-income ratio
-- =====================================================

SELECT
    ROUND(
        SUM(Employee_Cost + Rent_Expense + Other_Operating_Expense)
        / SUM(Interest_Income + Fee_Income) * 100,
        2
    ) AS Cost_to_Income_Ratio

FROM branch_data;


-- =====================================================
-- STEP 11: Calculate total customers
-- =====================================================

SELECT
    SUM(Customers) AS Total_Customers

FROM branch_data;


-- =====================================================
-- STEP 12: Calculate total deposits and loans
-- =====================================================

SELECT
    ROUND(SUM(Deposits), 2) AS Total_Deposits,
    ROUND(SUM(Loans), 2) AS Total_Loans

FROM branch_data;


-- =====================================================
-- STEP 13: Calculate total loan defaults
-- =====================================================

SELECT
    SUM(Loan_Defaults) AS Total_Loan_Defaults

FROM branch_data;


-- =====================================================
-- STEP 14: Analyze branch-wise profit
-- =====================================================

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


-- =====================================================
-- STEP 15: Analyze region-wise profit
-- =====================================================

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


-- =====================================================
-- STEP 16: Analyze monthly profit
-- =====================================================

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


-- =====================================================
-- STEP 17: Find top 5 branches by customer count
-- =====================================================

SELECT
    Branch_ID,
    Branch_Name,
    SUM(Customers) AS Total_Customers

FROM branch_data

GROUP BY Branch_ID, Branch_Name

ORDER BY Total_Customers DESC

LIMIT 5;
