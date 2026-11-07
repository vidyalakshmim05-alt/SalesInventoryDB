/*
Run after Database/Create_Database.sql.
The script creates 11 related tables.
*/
USE SalesInventoryDB;
GO

CREATE TABLE dbo.Categories (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL UNIQUE,
    Description VARCHAR(200) NULL
);
GO

CREATE TABLE dbo.Departments (
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL UNIQUE
);
GO

CREATE TABLE dbo.Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeName VARCHAR(100) NOT NULL,
    DepartmentID INT NOT NULL,
    JobTitle VARCHAR(60) NULL,
    JoiningDate DATE NOT NULL,
    Salary DECIMAL(10,2) NOT NULL CHECK (Salary >= 0),
    CONSTRAINT FK_Employees_Departments
        FOREIGN KEY (DepartmentID) REFERENCES dbo.Departments(DepartmentID)
);
GO

CREATE TABLE dbo.Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Email VARCHAR(120) NULL UNIQUE,
    Phone VARCHAR(20) NULL,
    City VARCHAR(60) NULL,
    CreatedDate DATE NOT NULL DEFAULT (CAST(GETDATE() AS DATE))
);
GO

CREATE TABLE dbo.Suppliers (
    SupplierID INT IDENTITY(1,1) PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL,
    ContactName VARCHAR(100) NULL,
    Phone VARCHAR(20) NULL,
    City VARCHAR(60) NULL
);
GO

CREATE TABLE dbo.Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    CategoryID INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL CHECK (UnitPrice >= 0),
    Quantity INT NOT NULL DEFAULT 0 CHECK (Quantity >= 0),
    CONSTRAINT FK_Products_Categories
        FOREIGN KEY (CategoryID) REFERENCES dbo.Categories(CategoryID)
);
GO

CREATE TABLE dbo.ProductSuppliers (
    ProductSupplierID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT NOT NULL,
    SupplierID INT NOT NULL,
    SupplyPrice DECIMAL(10,2) NOT NULL CHECK (SupplyPrice >= 0),
    CONSTRAINT FK_ProductSuppliers_Products
        FOREIGN KEY (ProductID) REFERENCES dbo.Products(ProductID),
    CONSTRAINT FK_ProductSuppliers_Suppliers
        FOREIGN KEY (SupplierID) REFERENCES dbo.Suppliers(SupplierID),
    CONSTRAINT UQ_ProductSuppliers_Product_Supplier
        UNIQUE (ProductID, SupplierID)
);
GO

CREATE TABLE dbo.Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    EmployeeID INT NOT NULL,
    OrderDate DATE NOT NULL DEFAULT (CAST(GETDATE() AS DATE)),
    OrderStatus VARCHAR(20) NOT NULL
        CHECK (OrderStatus IN ('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled')),
    CONSTRAINT FK_Orders_Customers
        FOREIGN KEY (CustomerID) REFERENCES dbo.Customers(CustomerID),
    CONSTRAINT FK_Orders_Employees
        FOREIGN KEY (EmployeeID) REFERENCES dbo.Employees(EmployeeID)
);
GO

CREATE TABLE dbo.OrderDetails (
    OrderDetailID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    UnitPrice DECIMAL(10,2) NOT NULL CHECK (UnitPrice >= 0),
    CONSTRAINT FK_OrderDetails_Orders
        FOREIGN KEY (OrderID) REFERENCES dbo.Orders(OrderID),
    CONSTRAINT FK_OrderDetails_Products
        FOREIGN KEY (ProductID) REFERENCES dbo.Products(ProductID),
    CONSTRAINT UQ_OrderDetails_Order_Product UNIQUE (OrderID, ProductID)
);
GO

CREATE TABLE dbo.Payments (
    PaymentID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL,
    PaymentDate DATE NOT NULL,
    Amount DECIMAL(10,2) NOT NULL CHECK (Amount >= 0),
    PaymentMethod VARCHAR(30) NOT NULL,
    PaymentStatus VARCHAR(20) NOT NULL
        CHECK (PaymentStatus IN ('Pending', 'Paid', 'Failed', 'Refunded')),
    CONSTRAINT FK_Payments_Orders
        FOREIGN KEY (OrderID) REFERENCES dbo.Orders(OrderID)
);
GO

CREATE TABLE dbo.Stock (
    StockID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT NOT NULL UNIQUE,
    AvailableQuantity INT NOT NULL CHECK (AvailableQuantity >= 0),
    ReorderLevel INT NOT NULL DEFAULT 5 CHECK (ReorderLevel >= 0),
    LastUpdated DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT FK_Stock_Products
        FOREIGN KEY (ProductID) REFERENCES dbo.Products(ProductID)
);
GO
