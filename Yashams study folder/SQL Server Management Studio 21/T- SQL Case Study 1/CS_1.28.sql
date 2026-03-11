use Product_Table

select * from Product24

SELECT
    COUNT(*) AS [Records to Delete]
FROM
    Product24
WHERE
    TRIM(Type) = 'Regular'; 

BEGIN TRANSACTION;

DELETE FROM
    product24
WHERE
    Type = 'Regular';
ROLLBACK
