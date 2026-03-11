USE sams;
GO

-- Batch 2: Create or Modify the function
IF OBJECT_ID('dbo.StuffChicken') IS NOT NULL
    DROP FUNCTION dbo.StuffChicken;
GO

CREATE FUNCTION dbo.StuffChicken (
    @InputString VARCHAR(100)
)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @ResultString VARCHAR(100);
    DECLARE @BitesPosition INT;

    SET @BitesPosition = CHARINDEX('Bites', @InputString);

    IF @BitesPosition > 0
    BEGIN
        SET @ResultString = STUFF(@InputString, @BitesPosition, 0, 'Chicken ');
    END
    ELSE
    BEGIN
        SET @ResultString = @InputString;
    END

    RETURN @ResultString;
END
GO

-- Batch 3: Display the results ONLY for 'Quick Bites' rows
SELECT
    RestaurantName,
    RestaurantType AS OriginalType,  -- This column will show 'Quick Bites'
    dbo.StuffChicken(RestaurantType) AS StuffedType  -- This column will show 'Quick Chicken Bites'
FROM
    Jomato
WHERE
    RestaurantType = 'Quick Bites';  -- <<-- THIS LINE IS THE FIX
GO

SELECT
    RestaurantName,
    RestaurantType AS OriginalType,
    dbo.StuffChicken(RestaurantType) AS StuffedType
FROM
    Jomato
WHERE
    RestaurantType = 'Quick Bites';