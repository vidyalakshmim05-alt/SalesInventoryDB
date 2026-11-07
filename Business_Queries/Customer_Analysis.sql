USE SalesInventoryDB;
GO

-- 1. Customer-wise order count and total sales
SELECT c.CustomerID, c.CustomerName,
       COUNT(DISTINCT o.OrderID) AS TotalOrders,
       COALESCE(SUM(od.Quantity * od.UnitPrice), 0) AS TotalSales
FROM dbo.Customers AS c
LEFT JOIN dbo.Orders AS o ON o.CustomerID = c.CustomerID
LEFT JOIN dbo.OrderDetails AS od ON od.OrderID = o.OrderID
GROUP BY c.CustomerID, c.CustomerName
ORDER BY TotalSales DESC;

-- 2. Customers who have not placed any orders
SELECT c.CustomerID, c.CustomerName
FROM dbo.Customers AS c
LEFT JOIN dbo.Orders AS o ON o.CustomerID = c.CustomerID
WHERE o.OrderID IS NULL;

-- 3. Customer details for orders placed in October 2026
SELECT c.CustomerName, o.OrderID, o.OrderDate, o.OrderStatus
FROM dbo.Customers AS c
JOIN dbo.Orders AS o ON o.CustomerID = c.CustomerID
WHERE o.OrderDate >= '2026-10-01'
  AND o.OrderDate <  '2026-11-01'
ORDER BY o.OrderDate;
