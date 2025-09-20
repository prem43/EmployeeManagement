USE EmployeeManagementDb;
GO

-- Stored Procedure: Get Employee by ID
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_GetEmployeeById')
    DROP PROCEDURE sp_GetEmployeeById;
GO

CREATE PROCEDURE sp_GetEmployeeById
    @EmployeeId INT
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT Id, FirstName, LastName, Email, Phone, Department, Position, 
           HireDate, Salary, IsActive, CreatedDate, UpdatedDate
    FROM Employees 
    WHERE Id = @EmployeeId;
END
GO

-- Stored Procedure: Get All Active Employees
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_GetActiveEmployees')
    DROP PROCEDURE sp_GetActiveEmployees;
GO

CREATE PROCEDURE sp_GetActiveEmployees
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT Id, FirstName, LastName, Email, Phone, Department, Position, 
           HireDate, Salary, IsActive, CreatedDate, UpdatedDate
    FROM Employees 
    WHERE IsActive = 1
    ORDER BY LastName, FirstName;
END
GO

-- Stored Procedure: Search Employees
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_SearchEmployees')
    DROP PROCEDURE sp_SearchEmployees;
GO

CREATE PROCEDURE sp_SearchEmployees
    @SearchTerm NVARCHAR(100) = '',
    @Department NVARCHAR(50) = '',
    @IsActive BIT = NULL,
    @PageNumber INT = 1,
    @PageSize INT = 10
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @Offset INT = (@PageNumber - 1) * @PageSize;
    
    -- Get total count
    SELECT COUNT(*) as TotalCount
    FROM Employees 
    WHERE (@SearchTerm = '' OR FirstName LIKE '%' + @SearchTerm + '%' 
           OR LastName LIKE '%' + @SearchTerm + '%' 
           OR Email LIKE '%' + @SearchTerm + '%')
      AND (@Department = '' OR Department = @Department)
      AND (@IsActive IS NULL OR IsActive = @IsActive);
    
    -- Get paged results
    SELECT Id, FirstName, LastName, Email, Phone, Department, Position, 
           HireDate, Salary, IsActive, CreatedDate, UpdatedDate
    FROM Employees 
    WHERE (@SearchTerm = '' OR FirstName LIKE '%' + @SearchTerm + '%' 
           OR LastName LIKE '%' + @SearchTerm + '%' 
           OR Email LIKE '%' + @SearchTerm + '%')
      AND (@Department = '' OR Department = @Department)
      AND (@IsActive IS NULL OR IsActive = @IsActive)
    ORDER BY LastName, FirstName
    OFFSET @Offset ROWS
    FETCH NEXT @PageSize ROWS ONLY;
END
GO

-- Stored Procedure: Get Department Statistics
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_GetDepartmentStats')
    DROP PROCEDURE sp_GetDepartmentStats;
GO

CREATE PROCEDURE sp_GetDepartmentStats
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        Department,
        COUNT(*) as TotalEmployees,
        COUNT(CASE WHEN IsActive = 1 THEN 1 END) as ActiveEmployees,
        AVG(Salary) as AverageSalary,
        MIN(Salary) as MinSalary,
        MAX(Salary) as MaxSalary
    FROM Employees 
    GROUP BY Department
    ORDER BY Department;
END
GO

PRINT 'Stored procedures created successfully!';
