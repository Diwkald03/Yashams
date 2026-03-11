USE Fact_table;

SELECT * FROM fact24;

SELECT
    SUM(Marketing)
FROM
    fact24
WHERE
    ProductId = 1;