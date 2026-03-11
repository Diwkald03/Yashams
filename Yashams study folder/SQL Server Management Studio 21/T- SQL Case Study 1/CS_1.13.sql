USE Fact_table

SELECT
    SUM(Sales) AS [Total Sales Of 1, January '10 ]
FROM
    fact24
WHERE
    Date = '2010-01-01';

SELECT
    *
FROM
    fact24
WHERE
    Date = '2010-01-01';