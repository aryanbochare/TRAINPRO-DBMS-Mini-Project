# TRAINPRO-DBMS-Mini-Project
Training Institute Management &amp; Analytics System – DBMS Mini Project using MySQL
# TRAINPRO – Training Institute Management & Analytics System

## Project Overview
TRAINPRO is a DBMS mini project developed using MySQL to manage training institute operations and analyze student progress.

## Objectives
- Manage students, trainers, courses, and batches.
- Maintain enrollments, attendance, and assessment results.
- Generate reports using SQL queries.
- Analyze course enrollment, attendance, and student performance.

## Database Tables
1. Student
2. Trainer
3. Course
4. Batch
5. Enrollment
6. Attendance
7. AssessmentResult

## Relationships
- Course → Batch: One-to-Many
- Trainer → Batch: One-to-Many
- Student → Enrollment: One-to-Many
- Batch → Enrollment: One-to-Many
- Enrollment → Attendance: One-to-Many
- Enrollment → AssessmentResult: One-to-Many

## SQL Concepts Used
- Primary Keys and Foreign Keys
- JOIN operations
- Aggregate functions and GROUP BY
- HAVING and subqueries
- Views and window functions
- Attendance and performance analysis

## Project Files
- `TrainProDB_Final.sql` – MySQL script
- `TRAINPRO_Project_Report_Final.docx` – Project report
- `aryanbochare4@gmail.com.pptx` – Presentation
- `ER diagram workbench.png` – ER diagram

## Technology
- **Database:** MySQL 8.0+
- **Course:** B.Sc. Data Science – Semester III
- **Academic Year:** 2026–2027

## Conclusion
TRAINPRO demonstrates relational database design and SQL-based reporting for training institute management.
