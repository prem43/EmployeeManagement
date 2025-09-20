using EmployeeManagement.Models;
using EmployeeManagement.ViewModels;

namespace EmployeeManagement.Services
{
    public interface IEmployeeService
    {
        Task<EmployeeListViewModel> GetEmployeesAsync(string searchTerm = "", string department = "", bool? isActive = null, int page = 1, int pageSize = 10);
        Task<Employee?> GetEmployeeByIdAsync(int id);
        Task<Employee> CreateEmployeeAsync(EmployeeViewModel model);
        Task<Employee?> UpdateEmployeeAsync(int id, EmployeeViewModel model);
        Task<bool> DeleteEmployeeAsync(int id);
        Task<bool> ToggleEmployeeStatusAsync(int id);
        Task<List<string>> GetDepartmentsAsync();
        Task<Dictionary<string, object>> GetDashboardStatsAsync();
    }
}
