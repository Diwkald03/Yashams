USE Fact_table;

;WITH ProductAverages AS (
    SELECT
        ProductId,
        -- Using your column names with underscores
        AVG([Budget_Margin]) AS [Avg Budget Margin],
        AVG([Budget_Profit]) AS [Avg Budget Profit]
    FROM
        fact24
    GROUP BY
        ProductId
),
FilteredProducts AS (
    SELECT
        ProductId,
        [Avg Budget Margin],
        [Avg Budget Profit]
    FROM
        ProductAverages
    WHERE
        [Avg Budget Margin] > 100 -- THIS IS THE FILTER
)
SELECT
    F.*,
    FP.[Avg Budget Margin],
    FP.[Avg Budget Profit]
FROM
    fact24 F
INNER JOIN
    FilteredProducts FP ON F.ProductId = FP.ProductId -- THIS IS THE JOIN/EXCLUSION
ORDER BY
    F.ProductId, F.Date;