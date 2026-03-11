select
	s.salesmanId
	, s.name as salesmanName
	, s.commission
	, s.city
	, s.age
	, o.orderid
	, o.customerid
	, o.orderdate
	, o.amount

from sales s 
right join Orders o 
	on s.salesmanid = o.salesmanid
order by o.OrderId;