USE Fact_table

SELECT


    CASE 
        WHEN GROUPING_ID(DATENAME(year, CAST(Date AS DATE)), DATEPART(wk, CAST(Date AS DATE)), ProductId) = 3 THEN 'Weekly Total'
        WHEN GROUPING_ID(DATENAME(year, CAST(Date AS DATE)), DATEPART(wk, CAST(Date AS DATE)), ProductId) = 7 THEN 'Grand Total'
        ELSE CAST(DATENAME(year, CAST(Date AS DATE)) + ' - WK ' + CAST(DATEPART(wk, CAST(Date AS DATE)) AS VARCHAR) AS VARCHAR(50))
    END AS [Year - Week],
    
    CASE 
        WHEN GROUPING(ProductId) = 1 THEN 'All Products'
        ELSE CAST(ProductId AS VARCHAR(10)) 
    END AS Product_ID,
    
    SUM(Sales) AS Total_Sales
FROM
    fact24 
GROUP BY 
    ROLLUP(DATENAME(year, CAST(Date AS DATE)), DATEPART(wk, CAST(Date AS DATE)), ProductId)
ORDER BY
    [Year - Week], Total_Sales DESC;