--Zad1
SELECT UnitPrice, Quantity, Discount, (UnitPrice - UnitPrice * Discount) * Quantity AS UkupnaCijena
FROM "Order Details"
GROUP BY UnitPrice, Quantity, Discount

--Zad2
SELECT FirstName + ' ' + LastName + 'can be reached at x' + Extension AS ContactInfo
FROM Employees

--Zad3
SELECT FirstName + ' ' + LastName, DATEDIFF(YEAR, BirthDate, HireDate) AS HireAgeInaccurate, CAST(DATEDIFF(MONTH, BirthDate, HireDate) AS decimal(8, 2)) / 12 AS HireAgeAccurate
FROM Employees

--Zad4
SELECT UnitsInStock, UnitPrice,	(UnitsInStock * UnitPrice) AS UkupnaCijena, FLOOR(UnitsInStock * UnitPrice) AS UkupnaCijenaNiza, CEILING(UnitsInStock * UnitPrice) AS UkupnaCijenaVisa
FROM Products
ORDER BY UkupnaCijena

--Zad5
SELECT COUNT(DISTINCT OrderID) AS UkupanBrojNarudzbi
FROM "Order Details"

--Zad6
SELECT OrderID, COUNT(OrderID) as BrojStavki
FROM "Order Details"
GROUP BY OrderID

--Zad7
SELECT Products.ProductID, COUNT(OrderID) AS QuantiyOfOrders
FROM "Order Details", Products
WHERE Products.ProductID = 11 AND Quantity > 50
GROUP BY Products.ProductID

--Zad8
SELECT ProductID, AVG(UnitPrice) AS AveragePrice
FROM "Order Details"
GROUP BY ProductID
HAVING AVG(UnitPrice) > 70
ORDER BY AveragePrice

--Zad9
SELECT TOP 1 ProductID, SUM(Quantity)
FROM "Order Details"
GROUP BY ProductID
ORDER BY SUM(Quantity) DESC

--Zad10
SELECT ProductID, SUM((UnitPrice - UnitPrice * Discount) * Quantity) AS UkupanIznos, SUM(Quantity) AS UkupnaKolicina, MAX(Quantity) AS MaksimalnaKolicina,	MIN(Quantity) AS MinimalnaKolicina
FROM "Order Details"
GROUP BY ProductID