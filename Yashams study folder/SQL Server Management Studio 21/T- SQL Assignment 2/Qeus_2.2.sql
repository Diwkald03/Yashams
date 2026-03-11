use sams;
GO 

IF OBJECT_ID('dbo.GetMaxRatedRestaurant') IS NOT NULL
    DROP FUNCTION dbo.GetMaxRatedRestaurant;
GO


CREATE FUNCTION dbo.GetMaxRatedRestaurant ()
RETURNS @MaxRated TABLE
(
    RestaurantName NVARCHAR(255)  
    ,CuisinesType NVARCHAR(MAX)
    ,No_of_Rating INT
)
AS
BEGIN
    INSERT INTO @MaxRated (RestaurantName, CuisinesType, No_of_Rating)
    SELECT TOP 1
        RestaurantName,
        CuisinesType,
        [No_of_Rating]
    FROM
        Jomato
    ORDER BY
        [No_of_Rating] DESC;

    RETURN;
END
GO

SELECT * FROM dbo.GetMaxRatedRestaurant();
GO