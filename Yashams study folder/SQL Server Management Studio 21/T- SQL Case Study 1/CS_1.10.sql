SELECT
    F1.*, 
    (
        SELECT
            AVG(F2.Inventory)
        FROM
            fact24 F2 
        WHERE
            F2.ProductId = F1.ProductId
    ) AS [Average Inventory for Product]
FROM
    fact24 F1;