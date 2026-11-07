/*
Project: Sales and Inventory Management System
Database: SalesInventoryDB
SQL Server: T-SQL
Run this script first.
*/
IF DB_ID(N'SalesInventoryDB') IS NULL
BEGIN
    CREATE DATABASE SalesInventoryDB;
END;
GO

USE SalesInventoryDB;
GO
