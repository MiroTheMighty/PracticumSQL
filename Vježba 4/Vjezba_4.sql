-- Zad 1
SELECT Orders.OrderID, Employees.FirstName, Employees.LastName
FROM Employees INNER JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
WHERE Orders.ShippedDate > Orders.RequiredDate

-- Zad 2
SELECT Products.ProductID, Products.ProductName, "Order Details".Quantity
FROM Products INNER JOIN "Order Details" ON Products.ProductID = "Order Details".ProductID
WHERE "Order Details".Quantity < 200
ORDER BY Products.ProductName

-- Zad 3
SELECT o.OrderID, o.OrderDate, e.FirstName, e.LastName, c.CustomerID, c.CompanyName, c.ContactName
FROM Orders o INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID INNER JOIN Customers c ON o.CustomerID = c.CustomerID
ORDER BY o.OrderDate

-- Zad 4
SELECT p.ProductID, p.ProductName, COUNT(od.OrderID) AS "Br. nar"
FROM Products p LEFT JOIN "Order Details" od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY p.ProductName;

-- Zad 5
SELECT o.ShipCountry, COUNT(o.OrderID), COUNT(e.EmployeeID)
FROM Orders o RIGHT OUTER JOIN Employees e ON o.EmployeeID = e.EmployeeID
GROUP BY o.ShipCountry, o.OrderID

-- Zad 6
SELECT CompanyName, ContactName, Address, City, Country, Phone
FROM Suppliers UNION 
SELECT CompanyName, ContactName, Address, City, Country, Phone
FROM Customers
ORDER BY CompanyName

-- Zad 7
SELECT e.EmployeeID, FirstName, LastName
FROM Employees e INNER JOIN Orders od ON e.EmployeeID = od.EmployeeID
WHERE CustomerID = 'ALFKI' EXCEPT 
SELECT e.EmployeeID, FirstName, LastName
FROM Employees e INNER JOIN Orders o ON e.EmployeeID = o.EmployeeID
WHERE CustomerID = 'ROMEY'

-- Zad 8
SELECT DISTINCT ShipCity
FROM Orders INTERSECT
SELECT DISTINCT City
FROM Suppliers