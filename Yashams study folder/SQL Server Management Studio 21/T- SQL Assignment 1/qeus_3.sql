DROP TABLE IF EXISTS dbo.Customer;

CREATE TABLE dbo.Customer(
		SalesmanId INT NOT NULL
		, CustomerId INT NOT NULL
		, CustomerName VARCHAR(250)
		, PurchaseAmount INT
		);


INSERT INTO dbo.Customer(SalesmanId, CustomerId, CustomerName, PurchaseAmount)
VALUES(101, 2345, 'Andrew', 50)
,(103, 1575, 'Lucky', 4500)
,(104, 2345, 'Andrew', 4000)
,(107, 3747, 'Remona', 2700)
,(110, 4004, 'Julia', 4545);

SELECT * FROM dbo.Customer
WHERE CustomerName LIKE '%N' 
	OR PurchaseAmount > 500;
