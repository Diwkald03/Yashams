use Fact_table

SELECT
    Date,
    ProductId,
    Sales,
    DENSE_RANK() OVER (ORDER BY Sales desc) AS Sales_Dense_Rank
FROM
    fact24 
ORDER BY
    Sales_Dense_Rank,
    Sales desc;