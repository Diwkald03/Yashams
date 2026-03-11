USE sams;
GO

WITH AreaMaxRatings AS
(
    SELECT
        Area,
        MAX(Rating) AS MaxRating
    FROM
        Jomato
    WHERE
        Rating IS NOT NULL 
    GROUP BY
        Area
),


RankedAreas AS
(
    SELECT
        Area,
        MaxRating,
        
        ROW_NUMBER() OVER (ORDER BY MaxRating DESC) AS RowNum
    FROM
        AreaMaxRatings
)


SELECT
    RowNum, 
    Area,
    CAST(MaxRating AS DECIMAL(10, 3)) AS HighestRating
FROM
    RankedAreas
WHERE
    RowNum <= 5 
ORDER BY
    RowNum;
GO