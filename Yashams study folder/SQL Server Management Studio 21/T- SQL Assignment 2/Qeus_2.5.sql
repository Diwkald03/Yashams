use sams

SELECT
    COALESCE(RestaurantType, 'Grand Total') AS RestaurantType
    ,CAST(AVG(AverageCost) AS DECIMAL(10, 2)) AS TotalAverageCost
FROM
    Jomato
GROUP BY
    ROLLUP(RestaurantType);