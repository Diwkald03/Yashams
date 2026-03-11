USE sams;
GO

IF OBJECT_ID('dbo.TopRatingView') IS NOT NULL
    DROP VIEW dbo.TopRatingView;
GO

CREATE VIEW dbo.TopRatingView
AS
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
        ROW_NUMBER() OVER (ORDER BY MaxRating DESC) AS AreaRank
    FROM
        AreaMaxRatings
)
SELECT
    AreaRank,
    Area,
    CAST(MaxRating AS DECIMAL(10, 2)) AS HighestIndividualRating
FROM
    RankedAreas
WHERE
    AreaRank <= 5;
GO

SELECT * FROM dbo.TopRatingView;
GO