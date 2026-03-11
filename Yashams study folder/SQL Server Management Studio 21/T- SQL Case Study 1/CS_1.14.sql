USE Fact_table

SELECT
    *,
    AVG([Total_Expenses]) OVER (PARTITION BY Date, ProductId) AS [Average Total Expenses (Date/Product)]
FROM
    fact24
ORDER BY
    Date, ProductId;