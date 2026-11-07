USE SalesInventoryDB;
GO

-- 1. Order-wise sales total
SELECT o.OrderID, o.OrderDate, o.OrderStatus,
       c.CustomerName,
       SUM(od.Quantity * od.UnitPrice) AS TotalAmount
FROM dbo.Orders AS o
JOIN dbo.Customers AS c ON c.CustomerID = o.CustomerID
JOIN dbo.OrderDetails AS od ON od.OrderID = o.OrderID
GROUP BY o.OrderID, o.OrderDate, o.OrderStatus, c.CustomerName
ORDER BY o.OrderDate;

-- 2. Monthly revenue
SELECT YEAR(o.OrderDate) AS SalesYear,
       MONTH(o.OrderDate) AS SalesMonth,
       SUM(od.Quantity * od.UnitPrice) AS MonthlyRevenue
FROM dbo.Orders AS o
JOIN dbo.OrderDetails AS od ON od.OrderID = o.OrderID
WHERE o.OrderStatus <> 'Cancelled'
GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate)
ORDER BY SalesYear, SalesMonth;

-- 3. Orders by status
SELECT OrderStatus, COUNT(*) AS OrderCount
FROM dbo.Orders
GROUP BY OrderStatus
ORDER BY OrderCount DESC;

-- 4. Payment summary by method
SELECT PaymentMethod, PaymentStatus, SUM(Amount) AS TotalAmount
FROM dbo.Payments
GROUP BY PaymentMethod, PaymentStatus
ORDER BY PaymentMethod, PaymentStatus;
