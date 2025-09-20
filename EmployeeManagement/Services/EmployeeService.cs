using EmployeeManagement.Data;
using EmployeeManagement.Models;
using EmployeeManagement.ViewModels;
using Microsoft.EntityFrameworkCore;

namespace EmployeeManagement.Services
{
    public class EmployeeService : IEmployeeService
    {
        private readonly ApplicationDbContext _context;

        public EmployeeService(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<EmployeeListViewModel> GetEmployeesAsync(string searchTerm = "", string department = "", bool? isActive = null, int page = 1, int pageSize = 10)
        {
            var query = _context.Employees.AsQueryable();

            // Apply filters
            if (!string.IsNullOrEmpty(searchTerm))
            {
                query = query.Where(e => e.FirstName.Contains(searchTerm) || 
                                       e.LastName.Contains(searchTerm) || 
                                       e.Email.Contains(searchTerm));
            }

            if (!string.IsNullOrEmpty(department))
            {
                query = query.Where(e => e.Department == department);
            }

            if (isActive.HasValue)
            {
                query = query.Where(e => e.IsActive == isActive.Value);
            }

            var totalCount = await query.CountAsync();

            var employees = await query
                .OrderBy(e => e.LastName)
                .ThenBy(e => e.FirstName)
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();

            return new EmployeeListViewModel
            {
                Employees = employees,
                SearchTerm = searchTerm,
                Department = department,
                IsActive = isActive,
                Page = page,
                PageSize = pageSize,
                TotalCount = totalCount
            };
        }

        public async Task<Employee?> GetEmployeeByIdAsync(int id)
        {
            return await _context.Employees.FindAsync(id);
        }

        public async Task<Employee> CreateEmployeeAsync(EmployeeViewModel model)
        {
            var employee = new Employee
            {
                FirstName = model.FirstName,
                LastName = model.LastName,
                Email = model.Email,
                Phone = model.Phone,
                Department = model.Department,
                Position = model.Position,
                HireDate = model.HireDate,
                Salary = model.Salary,
                IsActive = model.IsActive,
                CreatedDate = DateTime.Now
            };

            _context.Employees.Add(employee);
            await _context.SaveChangesAsync();
            return employee;
        }

        public async Task<Employee?> UpdateEmployeeAsync(int id, EmployeeViewModel model)
        {
            var employee = await _context.Employees.FindAsync(id);
            if (employee == null) return null;

            employee.FirstName = model.FirstName;
            employee.LastName = model.LastName;
            employee.Email = model.Email;
            employee.Phone = model.Phone;
            employee.Department = model.Department;
            employee.Position = model.Position;
            employee.HireDate = model.HireDate;
            employee.Salary = model.Salary;
            employee.IsActive = model.IsActive;
            employee.UpdatedDate = DateTime.Now;

            await _context.SaveChangesAsync();
            return employee;
        }

        public async Task<bool> DeleteEmployeeAsync(int id)
        {
            var employee = await _context.Employees.FindAsync(id);
            if (employee == null) return false;

            _context.Employees.Remove(employee);
            await _context.SaveChangesAsync();
            return true;
        }

        public async Task<bool> ToggleEmployeeStatusAsync(int id)
        {
            var employee = await _context.Employees.FindAsync(id);
            if (employee == null) return false;

            employee.IsActive = !employee.IsActive;
            employee.UpdatedDate = DateTime.Now;
            await _context.SaveChangesAsync();
            return true;
        }

        public async Task<List<string>> GetDepartmentsAsync()
        {
            return await _context.Employees
                .Select(e => e.Department)
                .Distinct()
                .OrderBy(d => d)
                .ToListAsync();
        }

        public async Task<Dictionary<string, object>> GetDashboardStatsAsync()
        {
            var totalEmployees = await _context.Employees.CountAsync();
            var activeEmployees = await _context.Employees.CountAsync(e => e.IsActive);
            var inactiveEmployees = totalEmployees - activeEmployees;
            var averageSalary = await _context.Employees.Where(e => e.IsActive).AverageAsync(e => e.Salary);
            
            var departmentStats = await _context.Employees
                .Where(e => e.IsActive)
                .GroupBy(e => e.Department)
                .Select(g => new { Department = g.Key, Count = g.Count() })
                .OrderByDescending(x => x.Count)
                .ToListAsync();

            return new Dictionary<string, object>
            {
                ["TotalEmployees"] = totalEmployees,
                ["ActiveEmployees"] = activeEmployees,
                ["InactiveEmployees"] = inactiveEmployees,
                ["AverageSalary"] = averageSalary,
                ["DepartmentStats"] = departmentStats
            };
        }
    }
}
