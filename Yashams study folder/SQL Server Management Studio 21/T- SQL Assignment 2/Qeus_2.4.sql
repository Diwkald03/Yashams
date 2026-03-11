use sams;

SELECT
    Rating,
    CEILING(Rating) AS CeilRating,
    FLOOR(Rating) AS FloorRating,
    ABS(Rating) AS AbsoluteRating,
    GETDATE() AS CurrentDate,
    YEAR(GETDATE()) AS CurrentYear,
    DATENAME(MONTH, GETDATE()) AS CurrentMonthName,
    DAY(GETDATE()) AS CurrentDay
FROM
    Jomato;