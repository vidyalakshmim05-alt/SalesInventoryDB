USE SalesInventoryDB;
GO

CREATE OR ALTER PROCEDURE dbo.sp_GetCustomerSales
    @CustomerID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT c.CustomerID, c.CustomerName,
           o.OrderID, o.OrderDate, o.OrderStatus,
           SUM(od.Quantity * od.UnitPrice) AS TotalAmount
    FROM dbo.Customers AS c
    JOIN dbo.Orders AS o ON o.CustomerID = c.CustomerID
    JOIN dbo.OrderDetails AS od ON od.OrderID = o.OrderID
    WHERE c.CustomerID = @CustomerID
    GROUP BY c.CustomerID, c.CustomerName,
             o.OrderID, o.OrderDate, o.OrderStatus
    ORDER BY o.OrderDate;
END;
GO

-- Test the stored procedure
EXEC dbo.sp_GetCustomerSales @CustomerID = 1;
GO
