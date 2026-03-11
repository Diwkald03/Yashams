use Fact_table


SELECT [Area_Code] FROM fact24


INTERSECT
SELECT [Area Code] FROM Location;

SELECT DISTINCT 
    [Area_Code] AS [Area Code for fact table] 
FROM 
    fact24;