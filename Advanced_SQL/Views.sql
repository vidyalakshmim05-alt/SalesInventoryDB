USE SalesInventoryDB;
GO

CREATE OR ALTER VIEW dbo.vw_SalesSummary
AS
SELECT o.OrderID, c.CustomerName, o.OrderDate, o.OrderStatus,
       SUM(od.Quantity * od.UnitPrice) AS TotalAmount
FROM dbo.Orders AS o
JOIN dbo.Customers AS c ON c.CustomerID = o.CustomerID
JOIN dbo.OrderDetails AS od ON od.OrderID = o.OrderID
GROUP BY o.OrderID, c.CustomerName, o.OrderDate, o.OrderStatus;
GO

-- Test the view
SELECT * FROM dbo.vw_SalesSummary ORDER BY OrderDate;
GO
