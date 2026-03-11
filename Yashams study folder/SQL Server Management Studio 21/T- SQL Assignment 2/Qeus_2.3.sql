use sams;

SELECT
    *,  
    CASE
        WHEN Rating > 4.0 THEN 'Excellent'

        WHEN Rating > 3.5 AND Rating <= 4.0 THEN 'Good'
        
        WHEN Rating > 3.0 AND Rating <= 3.5 THEN 'Average'

        WHEN Rating < 3.0 THEN 'Bad'

        ELSE 'Not Rated'
    END AS RatingStatus
FROM
    Jomato;