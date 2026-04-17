USE SalesDB;
GO

DECLARE @i         INT = 1;
DECLARE @cust_id   INT;
DECLARE @prod_id   INT;
DECLARE @qty       INT;
DECLARE @price     DECIMAL(10,2);
DECLARE @disc      DECIMAL(5,2);
DECLARE @total     DECIMAL(12,2);
DECLARE @odate     DATE;
DECLARE @sdate     DATE;
DECLARE @status    NVARCHAR(20);
DECLARE @region    NVARCHAR(50);

WHILE @i <= 10000
BEGIN
    SET @cust_id = (ABS(CHECKSUM(NEWID())) % 20) + 1;
    SET @prod_id = (ABS(CHECKSUM(NEWID())) % 10) + 1;
    SET @qty     = (ABS(CHECKSUM(NEWID())) % 10) + 1;
    SET @disc    = ROUND((ABS(CHECKSUM(NEWID())) % 20), 2);

    SELECT @price = unit_price
    FROM  dbo.products
    WHERE product_id = @prod_id;

    SET @total = ROUND(@qty * @price * (1 - @disc / 100.0), 2);

    -- Spread orders across Jan 2022 – Dec 2023
    SET @odate = DATEADD(DAY,
                   ABS(CHECKSUM(NEWID())) % 730,
                   '2022-01-01');
    SET @sdate = DATEADD(DAY,
                   (ABS(CHECKSUM(NEWID())) % 7) + 1,
                   @odate);

    SET @status = CASE (ABS(CHECKSUM(NEWID())) % 4)
                    WHEN 0 THEN 'Delivered'
                    WHEN 1 THEN 'Shipped'
                    WHEN 2 THEN 'Processing'
                    ELSE        'Cancelled'
                  END;

    SET @region = CASE (ABS(CHECKSUM(NEWID())) % 4)
                    WHEN 0 THEN 'South'
                    WHEN 1 THEN 'North'
                    WHEN 2 THEN 'West'
                    ELSE        'East'
                  END;

    INSERT INTO dbo.sales_orders
    (order_id, customer_id, product_id, quantity, unit_price,
     discount_pct, total_amount, order_date, ship_date, status, region)
    VALUES
    (@i, @cust_id, @prod_id, @qty, @price,
     @disc, @total, @odate, @sdate, @status, @region);

    SET @i = @i + 1;
END;
GO

-- Verify row count — should show 10000
SELECT COUNT(*) AS total_orders FROM dbo.sales_orders;
GO
