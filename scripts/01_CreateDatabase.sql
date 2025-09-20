-- Create Database
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'EmployeeManagementDb')
BEGIN
    CREATE DATABASE EmployeeManagementDb;
END
GO

USE EmployeeManagementDb;
GO

-- Create Employees Table
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Employees' AND xtype='U')
BEGIN
    CREATE TABLE Employees (
        Id int IDENTITY(1,1) PRIMARY KEY,
        FirstName nvarchar(50) NOT NULL,
        LastName nvarchar(50) NOT NULL,
        Email nvarchar(100) NOT NULL UNIQUE,
        Phone nvarchar(15) NULL,
        Department nvarchar(50) NOT NULL,
        Position nvarchar(50) NOT NULL,
        HireDate datetime2 NOT NULL,
        Salary decimal(18,2) NOT NULL,
        IsActive bit NOT NULL DEFAULT 1,
        CreatedDate datetime2 NOT NULL DEFAULT GETDATE(),
        UpdatedDate datetime2 NULL
    );
END
GO

-- Create indexes for better performance
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Employees_Email')
BEGIN
    CREATE UNIQUE INDEX IX_Employees_Email ON Employees(Email);
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Employees_Department')
BEGIN
    CREATE INDEX IX_Employees_Department ON Employees(Department);
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Employees_IsActive')
BEGIN
    CREATE INDEX IX_Employees_IsActive ON Employees(IsActive);
END
GO

PRINT 'Database and tables created successfully!';
