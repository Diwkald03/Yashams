DROP TABLE IF EXISTS ORDERS;

CREATE TABLE Orders (
	OrderId INT NOT NULL PRIMARY KEY,
	CustomerId INT NOT NULL,
	SalesmanId int not null,
	OrderDate Date,
	Amount Money
	);

INSERT INTO dbo.Orders(OrderId, CustomerId, SalesmanId, OrderDate, Amount)
VALUES(5001, 2345, 101, '2025-07-01', 550),
(5003, 1234, 105, '2025-02-15', 1500);


SELECT 
	o.OrderId,
	o.OrderDate,
	s.Name as salesmanName,
	c.CustomerName,
	c.PurchaseAmount,
	s.Commission,
	s.City
FROM Orders o 
INNER JOIN Sales s
	ON o.SalesmanId = s.SalesmanId
INNER JOIN Customer c
	ON o.SalesmanId = c.SalesmanId
