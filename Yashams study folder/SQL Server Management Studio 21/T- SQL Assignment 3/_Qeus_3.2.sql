USE sams;
GO


BEGIN TRANSACTION;
PRINT '--- TRANSACTION STARTED ---';


SELECT
    COUNT(*) AS BeforeUpdate_CafeCount
FROM
    Jomato
WHERE
    CuisinesType LIKE '%Cafe%';


UPDATE Jomato
SET CuisinesType = REPLACE(CuisinesType, 'Cafe', 'Cafeteria')
WHERE CuisinesType LIKE '%Cafe%';

PRINT '--- UPDATE EXECUTED: All "Cafe" replaced with "Cafeteria" ---';


SELECT 
    RestaurantName,
    CuisinesType
FROM
    Jomato
WHERE
    CuisinesType LIKE '%Cafeteria%';

ROLLBACK TRANSACTION;
PRINT '--- TRANSACTION ROLLED BACK: Changes UNDONE. Data restored to original state. ---';


SELECT
    COUNT(*) AS AfterRollback_CafeCount
FROM
    Jomato
WHERE
    CuisinesType LIKE '%Cafe%';


GO


