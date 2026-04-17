
USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'SalesDB')
    DROP DATABASE SalesDB;
GO

CREATE DATABASE SalesDB;
GO

USE SalesDB;
GO

