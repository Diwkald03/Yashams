USE Product_Table

IF OBJECT_ID('dbo.GetProductsByProductType', 'P') IS NOT NULL
    DROP PROCEDURE dbo.GetProductsByProductType;
GO

CREATE PROCEDURE dbo.GetProductsByProductType
    @ProductTypeFilter NVARCHAR(50)
AS
BEGIN
    SELECT ProductId, [Product_Type], Product, Type
    FROM Product24  -- Replace 'Product' with your actual table name if necessary
    WHERE [Product_Type] = @ProductTypeFilter;
END
GO

EXEC dbo.GetProductsByProductType @ProductTypeFilter = 'Coffee';