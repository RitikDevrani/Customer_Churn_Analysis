CREATE DATABASE Customer_Churn_Analysis;
USE Customer_Churn_Analysis;
CREATE TABLE customers (
    customerID VARCHAR(20) PRIMARY KEY,
    gender VARCHAR(10),
    SeniorCitizen TINYINT,
    Partner VARCHAR(5),
    Dependents VARCHAR(5),
    tenure INT,
    PhoneService VARCHAR(5),
    MultipleLines VARCHAR(20),
    InternetService VARCHAR(20),
    OnlineSecurity VARCHAR(25),
    OnlineBackup VARCHAR(25),
    DeviceProtection VARCHAR(25),
    TechSupport VARCHAR(25),
    StreamingTV VARCHAR(25),
    StreamingMovies VARCHAR(25),
    Contract VARCHAR(20),
    PaperlessBilling VARCHAR(5),
    PaymentMethod VARCHAR(50),
    MonthlyCharges DECIMAL(10,2),
    TotalCharges DECIMAL(10,2),
    Churn VARCHAR(5)
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Customer Churn.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- 1. Total Customers
SELECT COUNT(*) AS Total_Customers FROM customers;

-- 2. Churn Distribution
SELECT Churn, COUNT(*) AS Total_Churn FROM customers
GROUP BY Churn;

-- 3. Churn Percentage
SELECT Churn, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customers) AS percentage FROM customers
GROUP BY Churn;

-- 4. Gender-wise Churn
SELECT gender, Churn, COUNT(*) AS Churn_by_Gender FROM customers
GROUP BY gender, Churn;

-- 5. Senior Citizen Churn
SELECT SeniorCitizen, Churn, COUNT(*) AS total FROM customers
GROUP BY SeniorCitizen, Churn;

-- 6. Contract Type vs Churn
SELECT Contract, Churn, COUNT(*) AS total FROM customers
GROUP BY Contract, Churn;

-- 7. Average Monthly Charges by Churn
SELECT Churn, AVG(MonthlyCharges) AS avg_monthly FROM customers
GROUP BY Churn;

-- 8. Average Tenure by Churn
SELECT Churn, AVG(tenure) AS avg_tenure FROM customers
GROUP BY Churn;

-- 9. Internet Service vs Churn
SELECT InternetService, Churn, COUNT(*) AS total FROM customers
GROUP BY InternetService, Churn;

-- 10. Payment Method vs Churn
SELECT PaymentMethod, Churn, COUNT(*) AS total FROM customers
GROUP BY PaymentMethod, Churn;

-- 11. Paperless Billing Impact
SELECT PaperlessBilling, Churn, COUNT(*) AS total FROM customers
GROUP BY PaperlessBilling, Churn;

-- 12. Tech Support vs Churn
SELECT TechSupport, Churn, COUNT(*) AS total FROM customers
GROUP BY TechSupport, Churn;

-- 13. Online Security vs Churn
SELECT OnlineSecurity, Churn, COUNT(*) AS total FROM customers
GROUP BY OnlineSecurity, Churn;

-- 14. High Value Customers
SELECT * FROM customers WHERE MonthlyCharges > 100;

-- 15. Customers with Long Tenure
SELECT * FROM customers WHERE tenure > 50;

-- 16. Churn Customers with High Charges
SELECT * FROM customers
WHERE Churn = 'Yes' AND MonthlyCharges > 80;

-- 17. Total Revenue
SELECT SUM(TotalCharges) AS total_revenue FROM customers;

-- 18. Revenue Loss due to Churn
SELECT SUM(TotalCharges) AS churn_loss FROM customers
WHERE Churn = 'Yes';

-- 19. Multiple Lines vs Churn
SELECT MultipleLines, Churn, COUNT(*) AS total FROM customers
GROUP BY MultipleLines, Churn;

-- 20. Top 10 Highest Paying Customers
SELECT customerID, MonthlyCharges FROM customers
ORDER BY MonthlyCharges DESC
LIMIT 10;

-- 21. Avg Monthly Charges by Contract Type
SELECT Contract, AVG(MonthlyCharges) AS avg_charges FROM customers
GROUP BY Contract;

-- 22. Customers with No Internet but Still Paying High
SELECT * FROM customers WHERE InternetService = 'No'
AND MonthlyCharges > 50;

-- 23. Tenure Group Analysis
SELECT 
    CASE 
        WHEN tenure <= 12 THEN '0-1 Year'
        WHEN tenure <= 24 THEN '1-2 Years'
        WHEN tenure <= 48 THEN '2-4 Years'
        ELSE '4+ Years'
    END AS tenure_group,
    COUNT(*) AS total_customers
FROM customers
GROUP BY tenure_group;

-- 24. Churn by Tenure Group
SELECT 
    CASE 
        WHEN tenure <= 12 THEN '0-1 Year'
        WHEN tenure <= 24 THEN '1-2 Years'
        WHEN tenure <= 48 THEN '2-4 Years'
        ELSE '4+ Years'
    END AS tenure_group,
    Churn,
    COUNT(*) AS total
FROM customers
GROUP BY tenure_group, Churn;

-- 25. High Risk Customers (Multiple Conditions)
SELECT * FROM customers
WHERE Contract = 'Month-to-month'
AND MonthlyCharges > 80
AND TechSupport = 'No'
AND Churn = 'Yes';

-- 26. Customers Using All Services
SELECT * FROM customers
WHERE OnlineSecurity = 'Yes'
AND OnlineBackup = 'Yes'
AND DeviceProtection = 'Yes'
AND TechSupport = 'Yes';

-- 27. Customers Using No Services
SELECT * FROM customers
WHERE OnlineSecurity = 'No'
AND OnlineBackup = 'No'
AND DeviceProtection = 'No'
AND TechSupport = 'No';

-- 28 30. Avg Revenue per Customer
SELECT SUM(TotalCharges) / COUNT(*) AS avg_revenue_per_customer FROM customers;

-- 29. Top 10 Longest Tenure Customers
SELECT customerID, tenure FROM customers
ORDER BY tenure DESC
LIMIT 10;

-- 30. Churn Customers Without Partner
SELECT COUNT(*)  FROM customers
WHERE Partner = 'No' AND Churn = 'Yes';