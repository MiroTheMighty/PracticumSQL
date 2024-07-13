-- Zadatak 1

CREATE FUNCTION fnIznosStavke (@OrderID INT, @ProductID INT)
RETURNS MONEY
AS
BEGIN
 DECLARE @iznos MONEY;

 SELECT @iznos = Quantity * UnitPrice
 FROM [Order Details]
 WHERE OrderID = @OrderID AND ProductID = @ProductID;

 RETURN @iznos;
END;
GO

SELECT od.OrderID, od.ProductID, od.Quantity, od.UnitPrice, dbo.fnIznosStavke(od.OrderID, od.ProductID) AS 'IznosStavke'
FROM [Order Details] od;

-- Zadatak 2

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
 SELECT OrderID, ProductID, Quantity, UnitPrice
 FROM [Order Details]
 WHERE Quantity * UnitPrice > @iznos;

 RETURN;
END;
GO

SELECT *
FROM dbo.fnStavkeIznosVeciOd(100);

-- Zadatak 3

DROP FUNCTION IF EXISTS dbo.fnStavkeIznosVeciOd, fnIznosStavke;


-- Zadatak 4

CREATE PROCEDURE spSelectAllProducts
AS
BEGIN
 SELECT *
 FROM Products;
END;
GO

EXEC spSelectAllProducts;

-- Zadatak 5

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

-- Zadatak 6

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

-- Zadatak 7

CREATE PROCEDURE spSalesReport
 @startOrderDate DATETIME,
 @endOrderDate DATETIME,
 @firstName NVARCHAR(50),
 @lastName NVARCHAR(50)
AS
BEGIN
 SELECT e.FirstName, e.LastName, COUNT(o.OrderID) AS NumberOfOrders, SUM(od.Quantity * od.UnitPrice) AS TotalAmount
 FROM Employees e INNER JOIN Orders o ON e.EmployeeID = o.EmployeeID INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
 WHERE o.OrderDate BETWEEN @startOrderDate AND @endOrderDate AND e.FirstName = @firstName AND e.LastName = @lastName
 GROUP BY e.FirstName, e.LastName;
END;
GO

EXEC spSalesReport
 @startOrderDate = '2024-01-01',
 @endOrderDate = '2024-12-31',
 @firstName = 'John',
 @lastName = 'Doe';

-- Zadatak 8

DROP PROCEDURE IF EXISTS spSalesReport, UpdateProductPrice, spSelectProduct, spSelectAllProducts;