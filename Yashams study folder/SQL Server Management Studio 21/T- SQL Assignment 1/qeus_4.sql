select distinct SalesmanId, DATALENGTH (SalesmanId) as DataLen  from sales;

select distinct SalesmanId, DATALENGTH (SalesmanId) as DataLen  from Customer;

(
	select CAST(SalesmanId as int)as SalesmanId from Sales
	union
	select cast(salesmanId as int)as salesmanId from Customer
)

except
(
	select cast(salesmanId as int) from Sales
	intersect
	select cast(SalesmanId as int) from customer
);


select salesmanId 
from sales
intersect 
select salesmanId 
from Customer;
