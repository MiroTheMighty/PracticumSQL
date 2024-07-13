-- Zad 1
INSERT INTO Employees (FirstName, LastName, Title)
VALUES ('Miro','Šimić','Student')
SELECT * FROM Employees

-- Zad 2
INSERT INTO Orders
(CustomerID,EmployeeID,OrderDate,RequiredDate,ShippedDate,ShipVia,Freight,ShipName,ShipAddress,ShipCity,ShipPostalCode,ShipCountry)
VALUES('VINET','14','1997-08-03 00:00:00.000','1997-08-10 00:00:00.000','1997-08-10 00:00:00.000','3','22.11','Toms Spezialitäten','Luisenstr. 48','Münster','44087','Germany')
SELECT * FROM Orders 
WHERE EmployeeID = 14

-- Zad 3 
UPDATE Employees
SET 
	TitleOfCourtesy = 'Mr.',
	BirthDate = '2002',
	HireDate = '2023',
	[Address] = 'Ulica Antuna Branka Šimića',
	City= 'Split',
	Region = 'DA',
	PostalCode = '21000',
	Country = 'HR',
	HomePhone = '(000) 000-0000',
	Extension = '0000',
	Photo = '0x131'
WHERE FirstName = 'Miro'
SELECT * 
FROM Employees

-- Zad 4
UPDATE Employees
SET FirstName = 'Ante'
WHERE FirstName = 'Miro'
SELECT * FROM Employees


-- Zad 5 
DELETE 
FROM Orders 
WHERE EmployeeID = 10
DELETE 
FROM Employees
WHERE FirstName = 'Ante'
SELECT * 
FROM Employees