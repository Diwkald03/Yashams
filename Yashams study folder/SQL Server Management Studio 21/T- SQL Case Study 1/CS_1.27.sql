USE Fact_table

SELECT
    [Date],
    ProductId,
    Sales
    ,[Total_expenses]
FROM
    fact24
WHERE
    [Total_Expenses] BETWEEN 100 AND 200;