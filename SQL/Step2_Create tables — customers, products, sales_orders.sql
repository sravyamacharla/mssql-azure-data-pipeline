use SalesDB


-- Customers dimension table
CREATE TABLE dbo.customers (
    customer_id   INT PRIMARY KEY,
    customer_name NVARCHAR(100),
    city          NVARCHAR(50),
    region        NVARCHAR(50),
    email         NVARCHAR(100),
    created_date  DATE
);
GO

-- Products dimension table
CREATE TABLE dbo.products (
    product_id       INT PRIMARY KEY,
    product_name     NVARCHAR(100),
    category         NVARCHAR(50),
    unit_price       DECIMAL(10,2),
    supplier         NVARCHAR(100)
);
GO

-- Main fact table � this is what ADF will load incrementally
CREATE TABLE dbo.sales_orders (
    order_id        INT PRIMARY KEY,
    customer_id     INT REFERENCES dbo.customers(customer_id),
    product_id      INT REFERENCES dbo.products(product_id),
    quantity        INT,
    unit_price      DECIMAL(10,2),
    discount_pct    DECIMAL(5,2),
    total_amount    DECIMAL(12,2),
    order_date      DATE,
    ship_date       DATE,
    status          NVARCHAR(20),
    region          NVARCHAR(50),
    updated_at      DATETIME DEFAULT GETDATE()
);
GO