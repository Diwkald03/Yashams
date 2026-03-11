USE Fact_table

SELECT * FROM fact24


SELECT
    *,
    (
        SELECT
            AVG(Sales)
        FROM
            fact24
        WHERE
            [Area_Code] = 719
    ) AS [Average Sales in Area Code 719]
FROM
    fact24
WHERE
    [Area_Code] = 719;

