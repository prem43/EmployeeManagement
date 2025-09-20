USE EmployeeManagementDb;
GO

-- Clear existing data (optional - remove if you want to keep existing data)
-- DELETE FROM Employees;
-- DBCC CHECKIDENT ('Employees', RESEED, 0);

-- Insert sample employee data
IF NOT EXISTS (SELECT 1 FROM Employees)
BEGIN
    INSERT INTO Employees (FirstName, LastName, Email, Phone, Department, Position, HireDate, Salary, IsActive, CreatedDate)
    VALUES 
    ('John', 'Doe', 'john.doe@company.com', '555-0101', 'Engineering', 'Software Engineer', '2023-01-15', 75000.00, 1, GETDATE()),
    ('Jane', 'Smith', 'jane.smith@company.com', '555-0102', 'Engineering', 'Senior Software Engineer', '2022-03-20', 95000.00, 1, GETDATE()),
    ('Mike', 'Johnson', 'mike.johnson@company.com', '555-0103', 'Marketing', 'Marketing Manager', '2023-02-10', 68000.00, 1, GETDATE()),
    ('Sarah', 'Williams', 'sarah.williams@company.com', '555-0104', 'HR', 'HR Specialist', '2023-04-05', 55000.00, 1, GETDATE()),
    ('David', 'Brown', 'david.brown@company.com', '555-0105', 'Finance', 'Financial Analyst', '2022-11-12', 62000.00, 1, GETDATE()),
    ('Lisa', 'Davis', 'lisa.davis@company.com', '555-0106', 'Engineering', 'DevOps Engineer', '2023-01-30', 82000.00, 1, GETDATE()),
    ('Robert', 'Miller', 'robert.miller@company.com', '555-0107', 'Sales', 'Sales Representative', '2023-03-15', 48000.00, 1, GETDATE()),
    ('Emily', 'Wilson', 'emily.wilson@company.com', '555-0108', 'Marketing', 'Content Specialist', '2023-05-20', 52000.00, 1, GETDATE()),
    ('James', 'Moore', 'james.moore@company.com', '555-0109', 'Engineering', 'Lead Developer', '2021-08-10', 105000.00, 1, GETDATE()),
    ('Amanda', 'Taylor', 'amanda.taylor@company.com', '555-0110', 'HR', 'HR Manager', '2022-01-25', 78000.00, 1, GETDATE()),
    ('Christopher', 'Anderson', 'chris.anderson@company.com', '555-0111', 'Finance', 'Finance Manager', '2021-12-05', 88000.00, 1, GETDATE()),
    ('Jessica', 'Thomas', 'jessica.thomas@company.com', '555-0112', 'Sales', 'Sales Manager', '2022-06-18', 72000.00, 1, GETDATE()),
    ('Daniel', 'Jackson', 'daniel.jackson@company.com', '555-0113', 'Engineering', 'QA Engineer', '2023-02-28', 65000.00, 1, GETDATE()),
    ('Michelle', 'White', 'michelle.white@company.com', '555-0114', 'Marketing', 'Digital Marketing Specialist', '2023-04-12', 58000.00, 1, GETDATE()),
    ('Kevin', 'Harris', 'kevin.harris@company.com', '555-0115', 'IT', 'System Administrator', '2022-09-30', 70000.00, 1, GETDATE()),
    ('Rachel', 'Martin', 'rachel.martin@company.com', '555-0116', 'Finance', 'Accountant', '2023-01-08', 54000.00, 1, GETDATE()),
    ('Steven', 'Thompson', 'steven.thompson@company.com', '555-0117', 'Sales', 'Account Executive', '2022-12-15', 65000.00, 1, GETDATE()),
    ('Nicole', 'Garcia', 'nicole.garcia@company.com', '555-0118', 'HR', 'Recruiter', '2023-03-22', 50000.00, 1, GETDATE()),
    ('Brian', 'Martinez', 'brian.martinez@company.com', '555-0119', 'Engineering', 'Frontend Developer', '2023-05-10', 72000.00, 1, GETDATE()),
    ('Ashley', 'Robinson', 'ashley.robinson@company.com', '555-0120', 'Marketing', 'Brand Manager', '2022-10-08', 75000.00, 1, GETDATE());

    PRINT 'Sample employee data inserted successfully!';
END
ELSE
BEGIN
    PRINT 'Employee data already exists. Skipping seed data insertion.';
END
GO

-- Display inserted data
SELECT COUNT(*) as 'Total Employees' FROM Employees;
SELECT Department, COUNT(*) as 'Employee Count' FROM Employees GROUP BY Department ORDER BY Department;
GO
