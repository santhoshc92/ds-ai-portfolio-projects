# **Food Delivery Platform Analytics (Jomato) – SQL Portfolio Project**


## **Project Overview**

This project showcases an end-to-end SQL data analytics workflow using a simulated food delivery platform dataset inspired by Zomato.
It demonstrates database design, data manipulation, and advanced querying techniques to extract actionable business insights.

The project is implemented using Microsoft SQL Server (SSMS) and covers beginner-to-advanced SQL concepts commonly used in real-world analytics roles.

---

## Key Insights & Analysis

- Analyzed food delivery platform data covering customers, restaurants, locations, ratings, and order behavior

- Designed a normalized relational database with customer and location dimensions to support scalable analysis

- Performed customer segmentation and location-based analysis to identify high-activity areas

- Evaluated restaurant performance using ratings, order volume, delivery time, and average cost metrics

- Identified top-rated and high-demand restaurants by cuisine and restaurant type

- Analyzed order trends over time to uncover peak demand periods

- Generated insights on delivery speed, customer demographics, and operational efficiency

---

## **Dataset Information**

The project uses multiple relational tables, including:

### **Jomato Tables**

- Restaurants

- Restaurant Types

- Cuisines

- Ratings

- Location Details

- Order Date & Time

## **Customer Table**

- Customer ID

- Name

- Email

- Age

- Salary

## **Location Table**

- Area Code

- Area Name

---

## **Project Objectives**

- Design a normalized relational database

- Perform comprehensive SQL analysis

- Apply advanced SQL features for reporting and insights

- Demonstrate production-level SQL practices for a portfolio

---

## **Project Components**

## **1. SQL Database Setup**

### **Database Creation & Restoration**

- Created database jomato_db in Microsoft SQL Server

- Restored dataset from a .bak file using SSMS:

	- Right-click Databases → Restore Database → Device → Add .bak file → Name Database → OK

- Renamed columns for clarity and consistency

### **Table Creation**

- customer – Customer information

- location – Area codes and area names

### **Constraints & Keys**

- Primary Keys
- Foreign Keys
- UNIQUE constraints
- Ensured referential integrity across tables

---

## **2. SQL Operations & Queries**

### Data Manipulation (DML)

- INSERT, UPDATE, DELETE, ALTER

- Random assignment of customer_id to orders

### Data Retrieval

- SELECT with:

	- WHERE

	- IN, NOT IN

	- AND / OR

- Sorting and filtering using ORDER BY

---

## 3. Aggregate & Analytical Functions

### Aggregate Functions

- SUM

- AVG

- MIN

- MAX

- COUNT

### Date & Time Analysis

- Extracted:

	- Day

	- Month

	- Year

	- Hour

	- Week

- Analyzed:

	- Weekly trends

	- Monthly trends

	- Yearly order patterns

### String & Math Functions

- SUBSTRING

- STUFF

- CEILING

- FLOOR

- ROUND

---

## 4. Conditional & Advanced SQL

### Conditional Expressions

- CASE

- IIF

### Window Functions

- RANK()

- DENSE_RANK()

- NTILE()

---

## 5. Joins & Relationships

- INNER JOIN

- LEFT JOIN

- RIGHT JOIN

- FULL OUTER JOIN

- CROSS JOIN

- Self joins 

---

## 6. Subqueries & CTEs

- Filtering and ranking

- Data updates and deletions

- Recursive and non-recursive CTEs

---

## 7. Stored Procedures, Views & Indexes

### Stored Procedures

-Parameterized queries

- Optional filters for dynamic reporting

### Views

-Top-rated restaurants


### Indexes

- Clustered indexes

- Non-clustered indexes for performance optimization

### Triggers

- Insert triggers to notify or log new records

---

## 8. Transactions & Exception Handling

- BEGIN TRANSACTION

- COMMIT and ROLLBACK

- TRY...CATCH blocks

- Safe updates with error handling

---

## Tools & Technologies

- Microsoft SQL Server

- SQL Server Management Studio (SSMS)

---

## Key Skills Demonstrated

- Database Design

- SQL Query Optimization

- Analytical Thinking

- Business Intelligence Concepts

- Production-ready SQL Practices

