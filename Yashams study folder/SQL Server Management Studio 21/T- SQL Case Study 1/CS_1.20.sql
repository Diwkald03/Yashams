SELECT TOP 1
    F.Profit AS [Maximum Profit],
    F.ProductId,
    P.[Product_Type]
FROM
    fact24 F -- Assumed fact table name
INNER JOIN
    -- You must replace 'Product' with the exact name of your Product table!
    Product P 
    ON F.ProductId = P.ProductId
ORDER BY
    F.Profit DESC;