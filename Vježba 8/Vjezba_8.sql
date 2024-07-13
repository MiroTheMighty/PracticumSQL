--1.ZDK
CREATE FUNCTION fnIznosStavke (@OrderID INT, @ProductID INT)
RETURNS MONEY
AS
BEGIN
DECLARE @iznos MONEY

 SELECT @iznos = Quantity * UnitPrice
 FROM [Order Details]
 WHERE OrderID = @OrderID AND ProductID = @ProductID;

 RETURN @iznos;
END;
GO

SELECT
 od.OrderID,
 od.ProductID,
 od.Quantity,
 od.UnitPrice,
 dbo.fnIznosStavke(od.OrderID, od.ProductID) AS 'IznosStavke'
FROM [Order Details] od;



--2.ZDK
CREATE FUNCTION dbo.fnStavkeIznosVeciOd (@iznos DECIMAL(10,2))
RETURNS @Rezultat TABLE (
 OrderID INT,
 ProductID INT,
 Quantity INT,
 UnitPrice MONEY
)
AS
BEGIN
 INSERT INTO @Rezultat (OrderID, ProductID, Quantity, UnitPrice)
 SELECT
 OrderID,
 ProductID,
 Quantity,
 UnitPrice
 FROM [Order Details]
 WHERE Quantity * UnitPrice > @iznos;

 RETURN;
END;
GO

SELECT *
FROM dbo.fnStavkeIznosVeciOd(100);


--3.ZDK
DROP FUNCTION IF EXISTS dbo.fnStavkeIznosVeciOd;


--4.ZDK
CREATE PROCEDURE spSelectAllProducts
AS
BEGIN
 SELECT *
 FROM Products;
END;
GO

EXEC spSelectAllProducts;


--5.ZDK
CREATE PROCEDURE spSelectProduct
 @ProductID INT
AS
BEGIN
 SELECT *
 FROM Products
 WHERE ProductID = @ProductID;
END;
GO

EXEC spSelectProduct @ProductID = 5;


--6.ZDK
CREATE PROCEDURE UpdateProductPrice
 @ProductID INT,
 @NewPrice MONEY
AS
BEGIN
 UPDATE Products
 SET UnitPrice = @NewPrice
 WHERE ProductID = @ProductID;
END;
GO

EXEC UpdateProductPrice @ProductID = 5, @NewPrice = 15.99;


--7.ZDK
CREATE PROCEDURE spSalesReport
 @startOrderDate DATETIME,
 @endOrderDate DATETIME,
 @firstName NVARCHAR(50),
 @lastName NVARCHAR(50)
AS
BEGIN
 SELECT
 e.FirstName,
 e.LastName,
 COUNT(o.OrderID) AS NumberOfOrders,
 SUM(od.Quantity * od.UnitPrice) AS TotalAmount
 FROM
 Employees e
 INNER JOIN
 Orders o ON e.EmployeeID = o.EmployeeID
 INNER JOIN
 [Order Details] od ON o.OrderID = od.OrderID
 WHERE
 o.OrderDate BETWEEN @startOrderDate AND @endOrderDate
 AND e.FirstName = @firstName
 AND e.LastName = @lastName
 GROUP BY
 e.FirstName,
 e.LastName;
END;
GO

EXEC spSalesReport
 @startOrderDate = '2024-01-01',
 @endOrderDate = '2024-12-31',
 @firstName = 'John',
 @lastName = 'Doe';


--8.ZDK
 Brisanje pohranjene procedure
DROP PROCEDURE IF EXISTS spSalesReport;


CREATE TRIGGER trgAfterInsertOrder
ON Orders
AFTER INSERT
AS
BEGIN
    DECLARE @OrderID INT, @OrderDate DATETIME, @CustomerID NCHAR(5), @EmployeeID INT

    SELECT @OrderID = i.OrderID, @OrderDate = i.OrderDate, @CustomerID = i.CustomerID, @EmployeeID = i.EmployeeID
    FROM inserted i

    INSERT INTO OrderLogs (OrderID, OrderDate, CustomerID, EmployeeID, Action)
    VALUES (@OrderID, @OrderDate, @CustomerID, @EmployeeID, 'INSERT')
END;
GO