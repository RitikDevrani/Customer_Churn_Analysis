# Customer Churn Analysis (SQL Project)
## Project Overview

This project performs Customer Churn Analysis using SQL to understand why customers leave a telecom service.

The analysis focuses on identifying patterns related to customer demographics, services, contract types, billing methods, and revenue impact. The goal is to help businesses reduce churn and improve customer retention.

# Objectives
The main objectives of this project are:

• Analyze customer churn patterns

• Identify high-risk customers likely to churn

• Understand the impact of services and contract types on churn

• Analyze revenue and loss due to churn

• Generate insights to improve customer retention

## Dataset Description
The dataset contains telecom customer information such as:

• Customer ID

• Gender

• Senior Citizen

• Partner and Dependents

• Tenure

• Phone and Internet Services

• Online Security and Tech Support

• Contract Type

• Payment Method

• Monthly Charges

• Total Charges

• Churn Status

# Technologies Used
This project uses the following tools:

• MySQL

• SQL Queries

• MySQL Workbench

• CSV Dataset

# Project Workflow
1 Data Import

The dataset was imported into MySQL after creating the database and table structure.

Example:

  CREATE DATABASE Customer_Churn_Analysis;
  
  USE Customer_Churn_Analysis;
  
  CREATE TABLE customers (
  
  customerID VARCHAR(20),
  
  gender VARCHAR(10),
  
  tenure INT,
  
  MonthlyCharges DECIMAL(10,2),
  
  
  TotalCharges DECIMAL(10,2),
  
  Churn VARCHAR(5)
  
  );

2 Data Loading

The dataset was loaded using LOAD DATA INFILE.

  LOAD DATA INFILE 'Customer Churn.csv'
  
  INTO TABLE customers;

3 Exploratory Data Analysis

Various SQL queries were used to analyze customer churn.

Key analysis includes:

• Total customers count

• Churn distribution and percentage

• Gender wise churn

• Contract type vs churn

• Payment method impact on churn

• Internet service and churn relationship

• Monthly charges and tenure analysis

• Revenue and churn loss analysis

Example query:

  SELECT Churn, COUNT(*) AS Total_Churn
  
  FROM customers
  
  GROUP BY Churn;

## Key Insights

Some important insights from the analysis:

• Customers with month-to-month contracts have higher churn rates

• Customers with higher monthly charges are more likely to churn

• Lack of Tech Support and Online Security increases churn

• Customers with short tenure are more likely to leave

• Significant revenue loss occurs due to churned customers

## Project Structure

Customer-Churn-Analysis

• Customer Churn Analysis.sql

• Customer Churn.csv

• README.md

## How to Run This Project
1 Clone the Repository
    
    https://github.com/your-username/customer-churn-analysis.git

2 Open MySQL Workbench

Create the database and run the SQL script.

3 Import the Dataset

Place the dataset file in MySQL uploads folder and run:

  LOAD DATA INFILE 'Customer Churn.csv'
  
  INTO TABLE customers;

4 Run SQL Queries

Execute the queries to analyze churn and generate insights.

## Future Improvements
Possible improvements for this project include:

• Creating Power BI dashboard for churn analysis

• Performing predictive churn modeling using machine learning

• Enhancing SQL queries for deeper insights

• Building a web dashboard for visualization

## Author

• Ritik Devrani

• Diploma in Computer Science

• BCA (IGNOU)
