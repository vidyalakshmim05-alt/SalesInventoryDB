USE SalesInventoryDB;
GO

-- 1. Products with category names
SELECT p.ProductID, p.ProductName, c.CategoryName,
       p.UnitPrice, p.Quantity
FROM dbo.Products AS p
JOIN dbo.Categories AS c ON c.CategoryID = p.CategoryID;

-- 2. Products at or below reorder level
SELECT p.ProductID, p.ProductName,
       s.AvailableQuantity, s.ReorderLevel
FROM dbo.Products AS p
JOIN dbo.Stock AS s ON s.ProductID = p.ProductID
WHERE s.AvailableQuantity <= s.ReorderLevel
ORDER BY s.AvailableQuantity;

-- 3. Total quantity sold by product
SELECT p.ProductID, p.ProductName,
       COALESCE(SUM(od.Quantity), 0) AS TotalQuantitySold
FROM dbo.Products AS p
LEFT JOIN dbo.OrderDetails AS od ON od.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalQuantitySold DESC;

-- 4. Supplier-wise products supplied
SELECT s.SupplierName, p.ProductName, ps.SupplyPrice
FROM dbo.Suppliers AS s
JOIN dbo.ProductSuppliers AS ps ON ps.SupplierID = s.SupplierID
JOIN dbo.Products AS p ON p.ProductID = ps.ProductID
ORDER BY s.SupplierName, p.ProductName;
