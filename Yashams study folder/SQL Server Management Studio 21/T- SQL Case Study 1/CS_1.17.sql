USE Fact_table;

SELECT
    L.State,
    SUM(F.Profit) AS [Total Profit],
    SUM(F.Sales) AS [Total Sales]
FROM
    fact24 F
INNER JOIN
    -- *** REPLACE THIS NAME WITH THE CORRECT TABLE NAME ***
    -- For example, if your table is named 'Location', change 'Location24 L' to 'Location L'
    Location L 
    -- Assuming your database stored 'Area Code' with a space and brackets
    ON F.[Area_Code] = L.[Area Code]
GROUP BY
    L.State
ORDER BY
    [Total Profit] DESC;