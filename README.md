# Database-Project by Samukelisiwe Thwala
---
# 📘 Student Records Management Database

## 📄 Project Description

This project is a relational database designed to manage student academic records for an educational institution. It includes core entities such as Students, Courses, Instructors, Programs, Departments, and related data like Enrollments, Grades, and Attendance. The database ensures data integrity through foreign keys and supports queries to track student performance, course offerings, and academic structures.

---

## ⚙️ Features

- Tracks student information and contact details.
- Manages courses, sections, and instructors.
- Handles student enrollment and grades.
- Records attendance data.
- Normalized design with proper relationships via foreign keys.

---

## 🚀 Setup Instructions

### 1. Prerequisites

Make sure you have a relational database system installed, such as:

- MySQL or MariaDB
- PostgreSQL
- SQLite (optional)
- SQL Server

Also, have a database client or interface ready (e.g., MySQL Workbench, pgAdmin, SSMS, or a terminal with CLI access).

---

### 2. Import the SQL File

#### 💻 Option A: Using MySQL Workbench

1. Open MySQL Workbench.
2. Connect to your local server.
3. Create a new schema (e.g., `student_records`).
4. Open the `student_records.sql` file.
5. Click **Run (⚡)** to execute and create the tables.

#### 🖥 Option B: Using the Command Line

```bash
mysql -u your_username -p your_database_name < path/to/student_records.sql

