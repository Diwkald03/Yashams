USE Fact_table

SELECT
    *, 
    (Sales * 1.05) AS [Increased Sales] 
FROM
    fact24; 