create database StudentRecordsdb;
use StudentRecordsdb;

create table Address(
Address_ID int primary key,
Street varchar(100) not null,
City varchar(100) not null,
Postal_Code int not null,
Province varchar(100) not null,
Country varchar(100) not null
);

create table Departments(
Department_ID int primary key,
Name varchar(100) not null,
Office_location varchar(100)
);

create table Programs(
Program_ID int primary key,
Name varchar(100) not null,
Degree_level varchar(100) not null,
Department_ID int not null,
foreign key (Department_ID) references Departments(Department_ID)
);

create table Students ( 
Student_ID int primary key, 
First_Name varchar(100) not null, 
Last_name varchar(100) not null, 
Date_of_birth date not null, 
Gender varchar(100) not null, 
Email varchar(100) unique not null, 
Cellphone int not null, 
Address_ID int not null, 
Program_ID int not null, 
foreign key (Address_ID) references Address(Address_ID),
foreign key (Program_ID) references Programs(Program_ID)
);

Create table Instructors(
Instructor_ID int primary key,
First_Name varchar(100) not null,
Last_Name varchar(100) not null,
Email varchar(100) unique not null,
Cellphone int not null,
Department_ID int not null,
foreign key (Department_ID) references Departments(Department_ID)
);

create table Courses(
Course_ID int primary key,
Course_Code varchar(100) unique not null,
Title varchar(100) not null,
Credit int not null,
Department_ID int not null,
foreign key (Department_ID) references Departments(Department_ID)
);

create table Sections(
Section_ID int primary key,
Course_ID int not null,
Term varchar(100) not null,
Instructor_ID int not null,
Schedule datetime not null,
Location varchar(100) not null,
foreign key (Course_ID) references Courses(Course_ID),
foreign key (Instructor_ID) references Instructors(Instructor_ID)
);

create table Enrollments(
Enrollment_ID int primary key,
Student_ID int not null,
Section_ID int not null,
Enrollment_Date date not null,
Status varchar(100) not null,
foreign key (Student_ID) references Students(Student_ID),
foreign key (Section_ID) references Sections(Section_ID)
);

create table Grades(
Grade_ID int primary key,
Enrollment_ID int not null,
Grade varchar(50) not null,
Grade_Date date not null,
foreign key (Enrollment_ID) references Enrollments(Enrollment_ID)
);

create table Attendance(
Attendance_ID int primary key,
Section_ID int not null,
Student_ID int not null,
Date date not null,
Status varchar(100) not null,
foreign key (Section_ID) references Sections(Section_ID),
foreign key (Student_ID) references Students(Student_ID)
);

--  Relationships

| Primary Table     | Foreign Key Column | References Table | References Column | Relationship               |
| ----------------- | ------------------ | ---------------- | ----------------- | -------------------------- |
| **Students**      | `address_id`       | Addresses        | `address_id`      | Student → Address (M:1)    |
| **Students**      | `program_id`       | Programs         | `program_id`      | Student → Program (M:1)    |
| **Programs**      | `department_id`    | Departments      | `department_id`   | Program → Department (M:1) |
| **Courses**       | `department_id`    | Departments      | `department_id`   | Course → Department (M:1)  |
| **Sections**      | `course_id`        | Courses          | `course_id`       | Section → Course (M:1)     |
| **Sections**      | `instructor_id`    | Instructors      | `instructor_id`   | Section → Instructor (M:1) |
| **Enrollments**   | `student_id`       | Students         | `student_id`      | Enrollment → Student (M:1) |
| **Enrollments**   | `section_id`       | Sections         | `section_id`      | Enrollment → Section (M:1) |
| **Grades**        | `enrollment_id`    | Enrollments      | `enrollment_id`   | Grade → Enrollment (1:1)   |
| **Advisors**      | `student_id`       | Students         | `student_id`      | Advisor → Student (M:1)    |
| **Advisors**      | `instructor_id`    | Instructors      | `instructor_id`   | Advisor → Instructor (M:1) |
| **Attendance**    | `student_id`       | Students         | `student_id`      | Attendance → Student (M:1) |
| **Attendance**    | `section_id`       | Sections         | `section_id`      | Attendance → Section (M:1) |

