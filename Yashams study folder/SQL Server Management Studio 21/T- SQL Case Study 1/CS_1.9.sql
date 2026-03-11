SELECT
    L.State,
    SUM(F.Profit) AS [Total Profit]
FROM
    fact24 F
INNER JOIN
    Location L 
    ON F.[Area_Code] = L.[Area Code]
WHERE
    L.State = 'Colorado'
GROUP BY
    L.State; 