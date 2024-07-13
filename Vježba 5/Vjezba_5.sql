-- Zad 1
SELECT OrderID, Quantity, (SELECT MAX(Quantity) FROM [Order Details]) AS MaxAny
FROM [Order Details]
WHERE ProductID = 23;

-- Zad 2
SELECT ProductID, ProductName, SupplierID
FROM Products
WHERE SupplierID IN (
	SELECT SupplierID 
	FROM Suppliers 
	WHERE CompanyName = 'Exotic Liquids' OR CompanyName = 'Tokyo Traders'
);

-- Zad 3
SELECT ProductID, ProductName 
FROM Products
WHERE UnitPrice = (
	SELECT UnitPrice 
	FROM Products 
	WHERE ProductName = 'Longlife Tofu'
);

-- Zad 4
SELECT * 
FROM Customers INNER JOIN Orders ON Orders.CustomerID = Customers.CustomerID
WHERE Orders.OrderDate = (
	SELECT MAX(OrderDate) 
	FROM Orders
);

-- Zad 5
SELECT ProductId, ProductName
FROM Products
WHERE ProductId NOT IN (
	SELECT ProductID 
	FROM [Order Details] 
	GROUP BY ProductID 
	HAVING SUM(Quantity) = 0
);

-- Zad 6
SELECT * 
FROM Customers
WHERE (
	SELECT SUM([Order Details].UnitPrice * [Order Details].Quantity) 
	FROM Orders LEFT JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
	GROUP BY Orders.CustomerID
	HAVING Orders.CustomerID = Customers.CustomerID) > 10000;

-- Zad 7
SELECT * 
FROM Customers
WHERE CustomerID IN (
	SELECT CustomerID 
	FROM Orders 
	WHERE Orders.ShipCountry = 'France' AND Orders.CustomerID = Customers.CustomerID);