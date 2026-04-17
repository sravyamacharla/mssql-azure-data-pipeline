-- Watermark table — ADF reads and updates this every run
CREATE TABLE dbo.watermark_table (
    table_name     NVARCHAR(100) PRIMARY KEY,
    last_load_date DATETIME
);
GO

-- Set initial watermark to before all data
INSERT INTO dbo.watermark_table VALUES
    ('sales_orders', '2000-01-01 00:00:00');
GO

-- Stored procedure — ADF calls this after each successful load
-- to update the watermark to the latest order date
CREATE OR ALTER PROCEDURE dbo.usp_UpdateWatermark
    @TableName     NVARCHAR(100),
    @NewWatermark  DATETIME
AS
BEGIN
    UPDATE dbo.watermark_table
    SET    last_load_date = @NewWatermark
    WHERE  table_name     = @TableName;
END;
GO

-- Final verification — run this to confirm everything is ready
SELECT 'customers'      AS tbl, COUNT(*) AS rows FROM dbo.customers
UNION ALL
SELECT 'products',              COUNT(*) FROM dbo.products
UNION ALL
SELECT 'sales_orders',          COUNT(*) FROM dbo.sales_orders
UNION ALL
SELECT 'watermark_table',       COUNT(*) FROM dbo.watermark_table;
GO