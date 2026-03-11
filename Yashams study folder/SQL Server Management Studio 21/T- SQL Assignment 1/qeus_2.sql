DROP TABLE IF EXISTS dbo.Sales;


DROP TABLE IF EXISTS dbo.Customer;


CREATE TABLE dbo.Sales(
		SalesmanId INT NOT NULL
		,Name VARCHAR(250)
		, Commission DECIMAL(10,2)
		, City VARCHAR(250)
		, Age INT
		);


ALTER TABLE dbo.Sales
ADD CONSTRAINT PK_Sales_SalesmanId
PRIMARY KEY (SalesmanId);


ALTER TABLE dbo.Sales
ADD CONSTRAINT DF_Sales_City 
DEFAULT 'Berlin' FOR City;


INSERT INTO dbo.Sales(SalesmanId, Name, Commission, City, Age)
VALUES(101, 'Joe', 50, 'California', 17)
,(102, 'Simon', 75, 'Texas', 25)
,(103, 'Jessie', 105, 'Florida', 35)
,(104, 'Danny', 100, 'Texas', 22)
,(105, 'lia', 65, 'New Jersey', 30);


select * from dbo.Sales;


CREATE TABLE dbo.Customer(
		SalesmanId INT NOT NULL
		, CustomerId INT NOT NULL
		, CustomerName VARCHAR(250)
		, PurchaseAmount INT
		);


ALTER TABLE dbo.Customer
ADD CONSTRAINT FK_Customer_Sales 
FOREIGN KEY (SalesmanId) REFERENCES
dbo.Sales(SalesmanId);


INSERT INTO dbo.Customer(SalesmanId, CustomerId, CustomerName, PurchaseAmount)
VALUES(101, 2345, 'Andrew', 550)
,(103, 1575, 'Lucky', 4500)
,(104, 2345, 'Andrew', 4000);


select * from dbo.Customer;