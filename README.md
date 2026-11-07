# Sales and Inventory Management System

## Project Overview
A relational database project built with Microsoft SQL Server and T-SQL to manage customers, products, categories, suppliers, employees, sales orders, payments, and stock.

## Technologies
- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- T-SQL
- GitHub

## Database
`SalesInventoryDB`

## Database Tables
1. Categories
2. Departments
3. Employees
4. Customers
5. Suppliers
6. Products
7. ProductSuppliers
8. Orders
9. OrderDetails
10. Payments
11. Stock

## SQL Concepts
- Database and table creation
- Primary keys, foreign keys, UNIQUE, CHECK and DEFAULT constraints
- INSERT and SELECT statements
- INNER JOIN and LEFT JOIN
- GROUP BY, HAVING and aggregate functions
- CASE expressions and NULL handling (extend the query files with your practice examples)
- CTEs
- Window functions: RANK, DENSE_RANK, ROW_NUMBER and running totals
- Views and stored procedures

## Business Reports
- Order-wise and monthly sales summaries
- Customer-wise order and sales analysis
- Products below reorder level
- Product-wise sales quantity
- Supplier-wise product listing
- Employee order ranking

## How to Run
Run the scripts in this order in SQL Server Management Studio:
1. `Database/Create_Database.sql`
2. `Tables/Create_Tables.sql`
3. `Sample_Data/Insert_Data.sql`
4. Files in `Business_Queries/`
5. Files in `Advanced_SQL/`

Run each script in SSMS using **Execute**. The sample data is fictional and intended for project demonstration.

## Author
Vidya Lakshmi

---
Before publishing, execute all scripts in your own SQL Server instance and update this README if you make schema changes.
