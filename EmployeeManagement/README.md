# Employee Management System

A modern, professional Employee Management System built with ASP.NET Core MVC and Entity Framework Core.

## Features

- **Complete CRUD Operations**: Create, Read, Update, Delete employees
- **Professional Dark UI**: Modern Vercel-inspired dashboard design
- **Advanced Search & Filtering**: Search by name/email, filter by department and status
- **Dashboard with Statistics**: Employee counts, salary averages, and department distribution
- **Responsive Design**: Works perfectly on desktop and mobile devices
- **Form Validation**: Comprehensive client and server-side validation

## Quick Start

1. **Open the Solution**: Double-click `EmployeeManagement.sln` in Visual Studio
2. **Update Connection String**: In `appsettings.json`, replace `...` with your SQL Server password
3. **Run Database Scripts**: Execute the 3 SQL scripts in the `scripts` folder in order:
   - `01_CreateDatabase.sql`
   - `02_SeedData.sql` 
   - `03_StoredProcedures.sql`
4. **Build & Run**: Press F5 to start the application

## Database Connection

The application uses the following connection string format:
\`\`\`json
"DefaultConnection": "Server=PREM-JII\\SQLEXPRESS;Database=EmpolyManagmentDb;User Id=sa;Password=YOUR_PASSWORD;TrustServerCertificate=true;"
\`\`\`

## Technology Stack

- **Backend**: ASP.NET Core 8.0 MVC
- **Database**: SQL Server Express with Entity Framework Core
- **Frontend**: Bootstrap 5.3, Font Awesome 6.0, Custom CSS
- **Architecture**: Service Layer Pattern with Dependency Injection

## Project Structure

\`\`\`
EmployeeManagement/
├── Controllers/          # MVC Controllers
├── Models/              # Data Models and ViewModels
├── Services/            # Business Logic Layer
├── Data/                # Entity Framework DbContext
├── Views/               # Razor Views
├── wwwroot/             # Static Files (CSS, JS, Images)
└── scripts/             # Database Scripts
\`\`\`

## CSS Loading Fix

If CSS is not loading properly:
1. The application now uses CDN links for Bootstrap and jQuery
2. Ensure `app.UseStaticFiles()` is configured in Program.cs
3. Clear browser cache and restart the application

## Sample Data

The system includes 20 sample employees across different departments:
- IT Department
- HR Department  
- Finance Department
- Marketing Department
- Operations Department

## Support

For issues or questions, please check:
1. Database connection string is correct
2. SQL Server Express is running
3. Database scripts have been executed
4. Static files are being served properly
