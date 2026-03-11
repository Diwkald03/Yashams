USE sams;
GO

SELECT 
    ROW_NUMBER() OVER (ORDER BY OrderId) AS RN,
    * INTO 
    #T
FROM 
    Jomato 
ORDER BY 
    OrderId;
GO

DECLARE @O TABLE (
    OrderId INT, 
    RestaurantName VARCHAR(255), 
    RestaurantType VARCHAR(255), 
    Rating REAL, 
    No_of_Rating INT, 
    AverageCost REAL, 
    OnlineOrder VARCHAR(3), 
    TableBooking VARCHAR(3), 
    CuisinesType VARCHAR(MAX), 
    Area VARCHAR(255), 
    LocalAddress VARCHAR(255), 
    Delivery_time INT
);

DECLARE @C INT = 1; 
DECLARE @M INT = 50; 

WHILE @C <= @M
BEGIN
    INSERT INTO @O 
    SELECT
        r.OrderId, r.RestaurantName, r.RestaurantType, r.Rating, r.[No_of_Rating], 
        r.AverageCost, r.OnlineOrder, r.TableBooking, r.CuisinesType, r.Area, 
        r.LocalAddress, r.[Delivery_time]
    FROM #T r
    WHERE r.RN = @C;
    
    SET @C += 1;
END

SELECT * FROM @O;

DROP TABLE #T;
GO