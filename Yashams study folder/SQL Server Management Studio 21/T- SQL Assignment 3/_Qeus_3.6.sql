USE sams;
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE name = 'TR_Jomato_New')
    DROP TRIGGER TR_Jomato_New;
GO

CREATE TRIGGER TR_Jomato_New
ON Jomato
AFTER INSERT
AS
BEGIN
    DECLARE @NewRows INT;
    
    SELECT @NewRows = COUNT(*) FROM INSERTED;

    PRINT N'*** TRIGGER MESSAGE ***';
    PRINT N'A new record was successfully logged! Total records inserted: ' + CAST(@NewRows AS NVARCHAR(10));
    PRINT N'***********************';
END
GO

BEGIN TRANSACTION

INSERT INTO Jomato (
    [OrderId], [RestaurantName], [RestaurantType], [Rating], [No_of_Rating], 
    [AverageCost], [OnlineOrder], [TableBooking], [CuisinesType], [Area], 
    [LocalAddress], [Delivery_time]
)
VALUES (
    9999, 'Trigger Test Restaurant', 'Quick Bites', 4.5, 1, 500.0, 
    1,
    0,
    'Italian, Fast Food', 'Koramangala', 'HSR', 45
);
GO

SELECT * FROM Jomato WHERE OrderId = 9999;
GO

ROLLBACK TRANSACTION; 
GO

PRINT N'Trigger test complete and transaction rolled back.';