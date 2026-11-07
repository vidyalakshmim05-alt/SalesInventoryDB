USE SalesInventoryDB;
GO

-- Find products with at least two units sold
;WITH ProductSales AS
(
    SELECT p.ProductID, p.ProductName,
           SUM(od.Quantity) AS TotalQuantity
    FROM dbo.Products AS p
    JOIN dbo.OrderDetails AS od ON od.ProductID = p.ProductID
    GROUP BY p.ProductID, p.ProductName
)
SELECT ProductID, ProductName, TotalQuantity
FROM ProductSales
WHERE TotalQuantity >= 2
ORDER BY TotalQuantity DESC;
GO
