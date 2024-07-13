--Zad 1
SELECT * 
FROM Employees

--Zad2
SELECT ContactName, CompanyName, ContactTitle, Phone
FROM Customers

--Zad3
SELECT CategoryName, Description
FROM Categories
ORDER BY CategoryName

--Zad4
SELECT CompanyName, Fax, Phone, HomePage, Country
FROM Suppliers
ORDER BY Country DESC, CompanyName ASC

--Zad5
SELECT ContactName
FROM Customers
WHERE City = 'Buenos Aires'

--Zad6
SELECT ProductName, UnitPrice, QuantityPerUnit
FROM Products
WHERE UnitsInStock = 0

--Zad7
SELECT FirstName, LastName
FROM Employees
WHERE Country <> 'USA'

--Zad8
SELECT City, CompanyName, ContactName
FROM Customers
WHERE City LIKE 'A%' OR City LIKE 'B%'

--Zad9
SELECT *
FROM Orders
WHERE Freight > 500.00

--Zad10
SELECT CompanyName, ContactName, Fax
FROM Customers
WHERE Fax IS NOT NULL

--Zad11
SELECT FirstName, LastName
FROM Employees
WHERE ReportsTo IS NULL

--Zad12
SELECT FirstName, LastName, BirthDate
FROM Employees
WHERE BirthDate > '1949' AND BirthDate < '1960'

--Zad13
SELECT SupplierId
FROM Suppliers
WHERE CompanyName IN ('Exotic Liquids', 'Grandma Kelly''s Homestead', 'Tokyo Traders')

SELECT ProductName, SupplierId
FROM Products
WHERE SupplierID IN (1,3,4)

--Zad14
SELECT ShipPostalCode, OrderId, Orderdate
FROM Orders
WHERE ShipPostalCode LIKE '02389%'

--Zad15
SELECT ContactName, ContactTitle, CompanyName
FROM Customers
WHERE ContactTitle NOT LIKE '%Sales%'

--Zad16
SELECT FirstName, LastName, City
FROM Employees
WHERE City <> 'Seattle' AND Region = 'WA'