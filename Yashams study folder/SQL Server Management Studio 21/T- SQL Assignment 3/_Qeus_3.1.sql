USE sams;
GO

IF OBJECT_ID('dbo.GetTableBookingRestaurants') IS NOT NULL
    DROP PROCEDURE dbo.GetTableBookingRestaurants;
GO

CREATE PROCEDURE dbo.GetTableBookingRestaurants
AS
BEGIN
    SELECT
        RestaurantName,
        RestaurantType,
        CuisinesType
    FROM
        Jomato
    WHERE
        TRIM(TableBooking) <> 'No';
END
GO


EXEC dbo.GetTableBookingRestaurants;
GO