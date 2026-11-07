USE SalesInventoryDB;
GO

-- Rank employees by number of orders handled
;WITH EmployeeOrders AS
(
    SELECT e.EmployeeID, e.EmployeeName,
           COUNT(o.OrderID) AS TotalOrders
    FROM dbo.Employees AS e
    LEFT JOIN dbo.Orders AS o ON o.EmployeeID = e.EmployeeID
    GROUP BY e.EmployeeID, e.EmployeeName
)
SELECT EmployeeID, EmployeeName, TotalOrders,
       RANK() OVER (ORDER BY TotalOrders DESC) AS EmployeeRank,
       DENSE_RANK() OVER (ORDER BY TotalOrders DESC) AS DenseEmployeeRank,
       ROW_NUMBER() OVER (ORDER BY TotalOrders DESC, EmployeeID) AS RowNum
FROM EmployeeOrders;
GO

-- Running total of order revenue by date
SELECT o.OrderID, o.OrderDate,
       SUM(od.Quantity * od.UnitPrice) AS OrderAmount,
       SUM(SUM(od.Quantity * od.UnitPrice)) OVER
           (ORDER BY o.OrderDate, o.OrderID
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningRevenue
FROM dbo.Orders AS o
JOIN dbo.OrderDetails AS od ON od.OrderID = o.OrderID
GROUP BY o.OrderID, o.OrderDate;
GO
