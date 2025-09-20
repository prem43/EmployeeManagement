# Employee Management System

A comprehensive Employee Management System built with ASP.NET Core MVC, Entity Framework Core, and SQL Server Express. Features a modern, professional interface inspired by Vercel's design system.

## Features

- **Complete CRUD Operations**: Create, Read, Update, Delete employees
- **Advanced Search & Filtering**: Search by name/email, filter by department and status
- **Professional Dashboard**: Overview statistics and department distribution
- **Responsive Design**: Modern dark theme with professional styling
- **Data Validation**: Comprehensive client and server-side validation
- **Status Management**: Toggle employee active/inactive status
- **Pagination**: Efficient handling of large employee datasets

## Technology Stack

- **Backend**: ASP.NET Core 8.0 MVC
- **Database**: SQL Server Express
- **ORM**: Entity Framework Core 8.0
- **Frontend**: Bootstrap 5, Font Awesome, Custom CSS
- **Architecture**: Repository Pattern with Service Layer

## Database Setup

1. **Update Connection String**: 
   - Open `appsettings.json`
   - Replace the password in the connection string:
   \`\`\`json
   "DefaultConnection": "Server=....;Database=....;User Id=..;Password=YOUR_PASSWORD;TrustServerCertificate=true;"
   \`\`\`

2. **Run Database Scripts**:
   - Execute `scripts/01_CreateDatabase.sql` to create the database and tables
   - Execute `scripts/02_SeedData.sql` to populate with sample data
   - Execute `scripts/03_StoredProcedures.sql` to create stored procedures

## Getting Started

1. **Prerequisites**:
   - Visual Studio 2022
   - .NET 8.0 SDK
   - SQL Server Express

2. **First Run**:
   - The application will start with sample employee data
   - Navigate to the dashboard to see overview statistics
   - Use the Employees section to manage workforce data

## Key Features

### Dashboard
- Total employee count
- Active/inactive employee statistics
- Average salary calculation
- Department distribution with visual progress bars

### Employee Management
- Add new employees with comprehensive form validation
- Edit existing employee information
- View detailed employee profiles
- Toggle employee status (active/inactive)
- Delete employees with confirmation

### Search & Filter
- Real-time search by name or email
- Filter by department
- Filter by employment status
- Pagination for large datasets

### Professional UI
- Dark theme inspired by modern dashboards
- Responsive design for all screen sizes
- Intuitive navigation and user experience
- Professional typography and spacing

## Database Schema

## Contributing

This is a complete, production-ready Employee Management System. All CRUD operations are fully implemented and tested.

## License

This project is provided as-is for educational and business use.
