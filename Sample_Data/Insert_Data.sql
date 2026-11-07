/*
Run after Tables/Create_Tables.sql.
Sample records are fictional and for learning/demo purposes.
*/
USE SalesInventoryDB;
GO

INSERT INTO dbo.Categories (CategoryName, Description) VALUES
('Electronics', 'Electronic devices and accessories'),
('Furniture', 'Office and home furniture'),
('Stationery', 'Office and school supplies'),
('Clothing', 'Apparel products'),
('Accessories', 'General accessories');
GO

INSERT INTO dbo.Departments (DepartmentName) VALUES
('Sales'), ('IT'), ('Accounts'), ('Inventory');
GO

INSERT INTO dbo.Employees
(EmployeeName, DepartmentID, JobTitle, JoiningDate, Salary) VALUES
('Arun Kumar', 1, 'Sales Executive', '2023-01-15', 32000),
('Priya', 1, 'Sales Executive', '2022-06-10', 38000),
('Karthik', 2, 'System Administrator', '2021-08-01', 45000),
('Divya', 4, 'Inventory Executive', '2024-02-12', 29000);
GO

INSERT INTO dbo.Customers (CustomerName, Email, Phone, City) VALUES
('Ravi Stores', 'ravi@example.com', '9876500001', 'Chennai'),
('Meena Traders', 'meena@example.com', '9876500002', 'Coimbatore'),
('Kumar Agencies', 'kumar@example.com', '9876500003', 'Madurai'),
('Anu Enterprises', 'anu@example.com', '9876500004', 'Thoothukudi');
GO

INSERT INTO dbo.Suppliers (SupplierName, ContactName, Phone, City) VALUES
('Tech Supplies', 'Suresh', '9000000001', 'Chennai'),
('Office World', 'Mohan', '9000000002', 'Coimbatore'),
('Fashion Hub', 'Lakshmi', '9000000003', 'Tiruppur');
GO

INSERT INTO dbo.Products (ProductName, CategoryID, UnitPrice, Quantity) VALUES
('Laptop', 1, 55000.00, 10),
('Keyboard', 1, 1200.00, 25),
('Office Chair', 2, 4500.00, 15),
('Notebook', 3, 80.00, 100),
('T-Shirt', 4, 500.00, 50);
GO

INSERT INTO dbo.ProductSuppliers (ProductID, SupplierID, SupplyPrice) VALUES
(1, 1, 50000.00),
(2, 1, 900.00),
(3, 2, 3800.00),
(4, 2, 55.00),
(5, 3, 350.00);
GO

INSERT INTO dbo.Orders (CustomerID, EmployeeID, OrderDate, OrderStatus) VALUES
(1, 1, '2026-10-01', 'Delivered'),
(2, 2, '2026-10-03', 'Shipped'),
(1, 1, '2026-10-10', 'Processing'),
(3, 2, '2026-10-12', 'Pending'),
(4, 1, '2026-10-15', 'Delivered');
GO

INSERT INTO dbo.OrderDetails (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 1, 55000.00),
(1, 2, 2, 1200.00),
(2, 3, 2, 4500.00),
(2, 4, 10, 80.00),
(3, 2, 3, 1200.00),
(3, 4, 5, 80.00),
(4, 5, 4, 500.00),
(5, 4, 20, 80.00);
GO

INSERT INTO dbo.Payments (OrderID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES
(1, '2026-10-01', 57400.00, 'UPI', 'Paid'),
(2, '2026-10-03', 5000.00, 'Card', 'Paid'),
(3, '2026-10-10', 4000.00, 'UPI', 'Pending'),
(4, '2026-10-12', 2000.00, 'Cash', 'Paid'),
(5, '2026-10-15', 1600.00, 'Bank Transfer', 'Paid');
GO

INSERT INTO dbo.Stock (ProductID, AvailableQuantity, ReorderLevel) VALUES
(1, 10, 3),
(2, 25, 10),
(3, 15, 5),
(4, 100, 20),
(5, 50, 10);
GO
