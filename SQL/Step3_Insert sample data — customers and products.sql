USE SalesDB;
GO

-- Insert 20 customers across Indian cities
INSERT INTO dbo.customers VALUES
(1,  'Arjun Sharma',    'Hyderabad', 'South', 'arjun@email.com',    '2022-01-10'),
(2,  'Priya Reddy',     'Bangalore', 'South', 'priya@email.com',    '2022-01-15'),
(3,  'Vikram Singh',    'Mumbai',    'West',  'vikram@email.com',   '2022-02-01'),
(4,  'Ananya Iyer',     'Chennai',   'South', 'ananya@email.com',   '2022-02-10'),
(5,  'Ravi Kumar',      'Delhi',     'North', 'ravi@email.com',     '2022-03-05'),
(6,  'Sneha Patel',     'Ahmedabad', 'West',  'sneha@email.com',    '2022-03-20'),
(7,  'Kiran Rao',       'Hyderabad', 'South', 'kiran@email.com',    '2022-04-01'),
(8,  'Meena Joshi',     'Pune',      'West',  'meena@email.com',    '2022-04-15'),
(9,  'Arun Nair',       'Kochi',     'South', 'arun@email.com',     '2022-05-01'),
(10, 'Deepa Verma',     'Kolkata',   'East',  'deepa@email.com',    '2022-05-20'),
(11, 'Suresh Menon',    'Bangalore', 'South', 'suresh@email.com',   '2022-06-10'),
(12, 'Lakshmi Das',     'Chennai',   'South', 'lakshmi@email.com',  '2022-06-25'),
(13, 'Rahul Gupta',     'Delhi',     'North', 'rahul@email.com',    '2022-07-05'),
(14, 'Pooja Shah',      'Mumbai',    'West',  'pooja@email.com',    '2022-07-18'),
(15, 'Naveen Pillai',   'Hyderabad', 'South', 'naveen@email.com',   '2022-08-01'),
(16, 'Kavitha Shetty',  'Mangalore', 'South', 'kavitha@email.com',  '2022-08-14'),
(17, 'Mohan Tiwari',    'Lucknow',   'North', 'mohan@email.com',    '2022-09-01'),
(18, 'Divya Krishnan',  'Coimbatore','South', 'divya@email.com',    '2022-09-20'),
(19, 'Sanjay Bose',     'Kolkata',   'East',  'sanjay@email.com',   '2022-10-05'),
(20, 'Asha Kulkarni',   'Pune',      'West',  'asha@email.com',     '2022-10-18');
GO

-- Insert 10 products across categories
INSERT INTO dbo.products VALUES
(1,  'Laptop Pro 15',      'Electronics',  75000.00, 'TechSupply Co'),
(2,  'Wireless Mouse',     'Electronics',   1200.00, 'TechSupply Co'),
(3,  'Office Chair',       'Furniture',     8500.00, 'FurnishIndia'),
(4,  'Standing Desk',      'Furniture',    22000.00, 'FurnishIndia'),
(5,  'Notebook Pack',      'Stationery',     350.00, 'PaperMart'),
(6,  'Mechanical Keyboard','Electronics',   4500.00, 'TechSupply Co'),
(7,  'Monitor 27 inch',    'Electronics',  18000.00, 'TechSupply Co'),
(8,  'Whiteboard Large',   'Stationery',    2800.00, 'PaperMart'),
(9,  'Ergonomic Backpack', 'Accessories',   3200.00, 'BagWorld'),
(10, 'USB Hub 7-port',     'Electronics',   1800.00, 'TechSupply Co');
GO