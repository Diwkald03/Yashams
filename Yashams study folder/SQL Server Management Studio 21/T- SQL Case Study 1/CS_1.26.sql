SELECT 
    ProductId, [Product_Type], Product 
FROM 
    Product24
WHERE 
    ProductId = 1;

BEGIN TRANSACTION;

UPDATE 
    Product24
SET 
    [Product_Type] = 'Tea'
WHERE 
    ProductId = 1;

SELECT 
    ProductId, [Product_Type], Product 
FROM 
    Product24
WHERE 
    ProductId = 1;
    
ROLLBACK TRANSACTION;

SELECT 
    ProductId, [Product_Type], Product 
FROM 
    Product24
WHERE 
    ProductId = 1;