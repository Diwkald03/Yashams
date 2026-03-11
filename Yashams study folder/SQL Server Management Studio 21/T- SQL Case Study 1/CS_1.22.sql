USE Fact_table



SELECT
    Date,
    ProductId,
    [Total_Expenses],
    Profit,
    

    CASE
        WHEN [Total_Expenses] < 60 THEN 'Profit'
        ELSE 'Loss'
    END AS Profit_Status

FROM
    fact24

ORDER BY
    [Total_Expenses] DESC;