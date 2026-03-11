use Fact_table

SELECT
    L.State,
    P.Product AS Product_Name,
    SUM(F.Profit) AS [Total Profit],
    SUM(F.Sales) AS [Total Sales]
FROM
    fact24 F
INNER JOIN
    
    Product P ON F.ProductId = P.ProductId
INNER JOIN
    Location L ON F.[Area_Code] = L.[Area Code] -- Using bracketed name for 'Area Code'
GROUP BY
    L.State,
    P.Product
ORDER BY
    L.State,
    [Total Profit] DESC;