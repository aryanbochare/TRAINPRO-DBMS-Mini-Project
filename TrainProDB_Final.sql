-- ============================================================
-- TRAINPRO - TRAINING INSTITUTE MANAGEMENT & ANALYTICS SYSTEM
-- DBMS MINI PROJECT
-- Technology: MySQL 8.0+
-- ============================================================

-- NOTE:
-- This is the FINAL REPRODUCIBLE SCRIPT.
-- It DROPS and recreates TrainProDB when executed.
-- Do NOT run it on your current database unless you want to rebuild it.

DROP DATABASE IF EXISTS TrainProDB;
CREATE DATABASE TrainProDB;
USE TrainProDB;

-- ============================================================
-- 1. TABLE CREATION
-- ============================================================

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    City VARCHAR(50),
    RegistrationDate DATE
);

CREATE TABLE Trainer (
    TrainerID INT PRIMARY KEY,
    TrainerName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Specialization VARCHAR(100),
    ExperienceYears INT
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    DurationMonths INT,
    Fees DECIMAL(10,2),
    Level VARCHAR(30)
);

CREATE TABLE Batch (
    BatchID INT PRIMARY KEY,
    CourseID INT NOT NULL,
    TrainerID INT NOT NULL,
    BatchName VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    Mode VARCHAR(20),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (TrainerID) REFERENCES Trainer(TrainerID)
);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT NOT NULL,
    BatchID INT NOT NULL,
    EnrollmentDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (BatchID) REFERENCES Batch(BatchID)
);

CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    EnrollmentID INT NOT NULL,
    AttendanceDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (EnrollmentID) REFERENCES Enrollment(EnrollmentID)
);

CREATE TABLE AssessmentResult (
    ResultID INT PRIMARY KEY,
    EnrollmentID INT NOT NULL,
    AssessmentName VARCHAR(100),
    AssessmentDate DATE,
    MarksObtained DECIMAL(5,2),
    MaxMarks DECIMAL(5,2),
    FOREIGN KEY (EnrollmentID) REFERENCES Enrollment(EnrollmentID)
);

-- ============================================================
-- 2. SAMPLE DATA - STUDENTS
-- ============================================================

INSERT INTO Student
(StudentID, StudentName, Email, Phone, City, RegistrationDate)
VALUES
(101,'Aarav Kulkarni','aarav.kulkarni@gmail.com','9000000101','Pune','2026-06-20'),
(102,'Riya Sharma','riya.sharma@gmail.com','9000000102','Mumbai','2026-06-20'),
(103,'Aditya Patil','aditya.patil@gmail.com','9000000103','Nashik','2026-06-21'),
(104,'Sneha Joshi','sneha.joshi@gmail.com','9000000104','Pune','2026-06-21'),
(105,'Om Deshmukh','om.deshmukh@gmail.com','9000000105','Nagpur','2026-06-22'),
(106,'Ananya Shah','ananya.shah@gmail.com','9000000106','Mumbai','2026-06-22'),
(107,'Vedant More','vedant.more@gmail.com','9000000107','Pune','2026-06-23'),
(108,'Isha Mehta','isha.mehta@gmail.com','9000000108','Thane','2026-06-23'),
(109,'Kunal Patil','kunal.patil@gmail.com','9000000109','Kolhapur','2026-06-24'),
(110,'Neha Kulkarni','neha.kulkarni@gmail.com','9000000110','Pune','2026-06-24'),
(111,'Rahul Jadhav','rahul.jadhav@gmail.com','9000000111','Nashik','2026-06-25'),
(112,'Priya Nair','priya.nair@gmail.com','9000000112','Mumbai','2026-06-25'),
(113,'Siddhant Pawar','siddhant.pawar@gmail.com','9000000113','Pune','2026-06-26'),
(114,'Mansi Chavan','mansi.chavan@gmail.com','9000000114','Satara','2026-06-26'),
(115,'Yash Gupta','yash.gupta@gmail.com','9000000115','Mumbai','2026-06-27'),
(116,'Tanvi Desai','tanvi.desai@gmail.com','9000000116','Pune','2026-06-27'),
(117,'Akash Shinde','akash.shinde@gmail.com','9000000117','Aurangabad','2026-06-28'),
(118,'Kavya Shah','kavya.shah@gmail.com','9000000118','Mumbai','2026-06-28'),
(119,'Harsh Vaidya','harsh.vaidya@gmail.com','9000000119','Pune','2026-06-29'),
(120,'Simran Khan','simran.khan@gmail.com','9000000120','Thane','2026-06-30');

-- ============================================================
-- 3. SAMPLE DATA - TRAINERS
-- ============================================================

INSERT INTO Trainer
(TrainerID, TrainerName, Email, Specialization, ExperienceYears)
VALUES
(201,'Rahul Mehta','rahul.mehta@trainpro.com','Data Science',8),
(202,'Priyanka Joshi','priyanka.joshi@trainpro.com','Python Programming',6),
(203,'Amit Kulkarni','amit.kulkarni@trainpro.com','Cyber Security',7),
(204,'Snehal Patil','snehal.patil@trainpro.com','Web Development',5),
(205,'Vikram Shah','vikram.shah@trainpro.com','Machine Learning',9),
(206,'Neeraj Deshmukh','neeraj.deshmukh@trainpro.com','SQL & Database',6);

-- ============================================================
-- 4. SAMPLE DATA - COURSES
-- ============================================================

INSERT INTO Course
(CourseID, CourseName, DurationMonths, Fees, Level)
VALUES
(301,'Data Science',6,45000.00,'Advanced'),
(302,'Python Programming',3,22000.00,'Beginner'),
(303,'Cyber Security',4,30000.00,'Intermediate'),
(304,'Web Development',4,28000.00,'Intermediate'),
(305,'Machine Learning',5,40000.00,'Advanced'),
(306,'SQL & Database Management',3,20000.00,'Beginner');

-- ============================================================
-- 5. SAMPLE DATA - BATCHES
-- ============================================================

INSERT INTO Batch
(BatchID, CourseID, TrainerID, BatchName, StartDate, EndDate, Mode)
VALUES
(401,301,201,'DS-2026-A','2026-07-01','2026-12-31','Offline'),
(402,301,201,'DS-2026-B','2026-08-01','2027-01-31','Online'),
(403,302,202,'PY-2026-A','2026-07-15','2026-10-15','Offline'),
(404,303,203,'CS-2026-A','2026-07-10','2026-11-10','Online'),
(405,304,204,'WD-2026-A','2026-08-01','2026-12-01','Offline'),
(406,305,205,'ML-2026-A','2026-07-20','2026-12-20','Online'),
(407,306,206,'SQL-2026-A','2026-08-10','2026-11-10','Offline'),
(408,303,203,'CS-2026-B','2026-09-01','2027-01-01','Offline');

-- ============================================================
-- 6. SAMPLE DATA - ENROLLMENTS
-- ============================================================

INSERT INTO Enrollment
(EnrollmentID, StudentID, BatchID, EnrollmentDate, Status)
VALUES
(501,101,401,'2026-06-20','Active'),
(502,102,401,'2026-06-20','Active'),
(503,103,401,'2026-06-21','Active'),
(504,104,402,'2026-06-21','Active'),
(505,105,402,'2026-06-22','Active'),
(506,106,403,'2026-06-22','Active'),
(507,107,403,'2026-06-23','Active'),
(508,108,404,'2026-06-23','Active'),
(509,109,404,'2026-06-24','Active'),
(510,110,405,'2026-06-24','Active'),
(511,111,405,'2026-06-25','Active'),
(512,112,406,'2026-06-25','Active'),
(513,113,406,'2026-06-26','Active'),
(514,114,407,'2026-06-26','Active'),
(515,115,407,'2026-06-27','Active'),
(516,116,408,'2026-06-27','Active'),
(517,117,408,'2026-06-28','Active'),
(518,118,401,'2026-06-28','Active'),
(519,119,402,'2026-06-29','Active'),
(520,120,403,'2026-06-30','Active');

-- ============================================================
-- 7. ATTENDANCE - 10 SESSIONS PER ENROLLMENT = 200 RECORDS
-- ============================================================

WITH RECURSIVE SessionDays AS (
    SELECT 0 AS DayNo
    UNION ALL
    SELECT DayNo + 1
    FROM SessionDays
    WHERE DayNo < 9
)
INSERT INTO Attendance
(AttendanceID, EnrollmentID, AttendanceDate, Status)
SELECT
    (e.EnrollmentID * 10) + d.DayNo + 1 AS AttendanceID,
    e.EnrollmentID,
    DATE_ADD(e.EnrollmentDate, INTERVAL d.DayNo DAY) AS AttendanceDate,
    CASE
        WHEN e.EnrollmentID IN (505,509,514)
             AND MOD(d.DayNo,2) = 1 THEN 'Absent'
        WHEN MOD(e.EnrollmentID + d.DayNo,7) = 0 THEN 'Absent'
        ELSE 'Present'
    END AS Status
FROM Enrollment e
CROSS JOIN SessionDays d
ORDER BY e.EnrollmentID, d.DayNo;

-- ============================================================
-- 8. ASSESSMENT RESULTS - 4 ASSESSMENTS PER ENROLLMENT = 80
-- ============================================================

WITH TestTypes AS (
    SELECT 1 AS TestNo, 'SQL / Technical Test' AS AssessmentName, 7 AS DayOffset
    UNION ALL SELECT 2, 'Practical Test', 14
    UNION ALL SELECT 3, 'Mid-Term Assessment', 21
    UNION ALL SELECT 4, 'Final Assessment', 30
)
INSERT INTO AssessmentResult
(ResultID, EnrollmentID, AssessmentName, AssessmentDate, MarksObtained, MaxMarks)
SELECT
    (e.EnrollmentID * 10) + t.TestNo AS ResultID,
    e.EnrollmentID,
    t.AssessmentName,
    DATE_ADD(e.EnrollmentDate, INTERVAL t.DayOffset DAY) AS AssessmentDate,
    CASE
        WHEN e.EnrollmentID IN (501,502,508)
            THEN 82 + MOD(e.EnrollmentID + t.TestNo,14)
        WHEN e.EnrollmentID IN (505,509,514)
            THEN 45 + MOD(e.EnrollmentID + t.TestNo,12)
        ELSE
            60 + MOD(e.EnrollmentID + (t.TestNo * 3),26)
    END AS MarksObtained,
    100 AS MaxMarks
FROM Enrollment e
CROSS JOIN TestTypes t
ORDER BY e.EnrollmentID, t.TestNo;

-- ============================================================
-- 9. STUDENT PROGRESS VIEW
-- ============================================================

CREATE OR REPLACE VIEW StudentProgressView AS
WITH AttendanceSummary AS (
    SELECT
        EnrollmentID,
        COUNT(*) AS TotalSessions,
        SUM(CASE WHEN Status = 'Present' THEN 1 ELSE 0 END) AS PresentSessions
    FROM Attendance
    GROUP BY EnrollmentID
),
AssessmentSummary AS (
    SELECT
        EnrollmentID,
        ROUND(AVG(MarksObtained),2) AS AverageScore
    FROM AssessmentResult
    GROUP BY EnrollmentID
)
SELECT
    e.EnrollmentID,
    s.StudentName,
    c.CourseName,
    b.BatchName,
    t.TrainerName,
    a.TotalSessions,
    a.PresentSessions,
    ROUND(a.PresentSessions * 100.0 / a.TotalSessions,2)
        AS AttendancePercentage,
    r.AverageScore
FROM Enrollment e
JOIN Student s ON e.StudentID = s.StudentID
JOIN Batch b ON e.BatchID = b.BatchID
JOIN Course c ON b.CourseID = c.CourseID
JOIN Trainer t ON b.TrainerID = t.TrainerID
JOIN AttendanceSummary a ON e.EnrollmentID = a.EnrollmentID
JOIN AssessmentSummary r ON e.EnrollmentID = r.EnrollmentID;

-- ============================================================
-- 10. VERIFICATION QUERIES
-- ============================================================

SELECT 'TRAINPRO DATABASE CREATED SUCCESSFULLY' AS Status;

SELECT COUNT(*) AS TotalStudents FROM Student;
SELECT COUNT(*) AS TotalTrainers FROM Trainer;
SELECT COUNT(*) AS TotalCourses FROM Course;
SELECT COUNT(*) AS TotalBatches FROM Batch;
SELECT COUNT(*) AS TotalEnrollments FROM Enrollment;
SELECT COUNT(*) AS TotalAttendanceRecords FROM Attendance;
SELECT COUNT(*) AS TotalAssessmentRecords FROM AssessmentResult;

-- ============================================================
-- 11. BUSINESS ANALYSIS QUERIES
-- ============================================================

-- Q1. Complete enrollment report
SELECT
    e.EnrollmentID,
    s.StudentName,
    c.CourseName,
    b.BatchName,
    t.TrainerName,
    e.EnrollmentDate,
    e.Status
FROM Enrollment e
JOIN Student s ON e.StudentID = s.StudentID
JOIN Batch b ON e.BatchID = b.BatchID
JOIN Course c ON b.CourseID = c.CourseID
JOIN Trainer t ON b.TrainerID = t.TrainerID
ORDER BY e.EnrollmentID;

-- Q2. Highest enrollment courses
SELECT
    c.CourseName,
    COUNT(e.EnrollmentID) AS TotalStudents
FROM Course c
JOIN Batch b ON c.CourseID = b.CourseID
JOIN Enrollment e ON b.BatchID = e.BatchID
GROUP BY c.CourseID, c.CourseName
ORDER BY TotalStudents DESC;

-- Q3. Student-wise attendance percentage
SELECT
    e.EnrollmentID,
    s.StudentName,
    c.CourseName,
    COUNT(a.AttendanceID) AS TotalSessions,
    SUM(CASE WHEN a.Status='Present' THEN 1 ELSE 0 END) AS PresentDays,
    ROUND(
        SUM(CASE WHEN a.Status='Present' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(a.AttendanceID), 2
    ) AS AttendancePercentage
FROM Enrollment e
JOIN Student s ON e.StudentID = s.StudentID
JOIN Batch b ON e.BatchID = b.BatchID
JOIN Course c ON b.CourseID = c.CourseID
JOIN Attendance a ON e.EnrollmentID = a.EnrollmentID
GROUP BY e.EnrollmentID, s.StudentName, c.CourseName
ORDER BY AttendancePercentage DESC;

-- Q4. Low attendance students
SELECT
    s.StudentName,
    c.CourseName,
    ROUND(
        SUM(CASE WHEN a.Status='Present' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(a.AttendanceID), 2
    ) AS AttendancePercentage
FROM Enrollment e
JOIN Student s ON e.StudentID = s.StudentID
JOIN Batch b ON e.BatchID = b.BatchID
JOIN Course c ON b.CourseID = c.CourseID
JOIN Attendance a ON e.EnrollmentID = a.EnrollmentID
GROUP BY e.EnrollmentID, s.StudentName, c.CourseName
HAVING AttendancePercentage < 75
ORDER BY AttendancePercentage ASC;

-- Q5. Average student performance
SELECT
    s.StudentName,
    c.CourseName,
    ROUND(AVG(ar.MarksObtained),2) AS AverageScore
FROM Enrollment e
JOIN Student s ON e.StudentID = s.StudentID
JOIN Batch b ON e.BatchID = b.BatchID
JOIN Course c ON b.CourseID = c.CourseID
JOIN AssessmentResult ar ON e.EnrollmentID = ar.EnrollmentID
GROUP BY e.EnrollmentID, s.StudentName, c.CourseName
ORDER BY AverageScore DESC;

-- Q6. Top 5 performers
SELECT
    s.StudentName,
    c.CourseName,
    ROUND(AVG(ar.MarksObtained),2) AS AverageScore
FROM Enrollment e
JOIN Student s ON e.StudentID = s.StudentID
JOIN Batch b ON e.BatchID = b.BatchID
JOIN Course c ON b.CourseID = c.CourseID
JOIN AssessmentResult ar ON e.EnrollmentID = ar.EnrollmentID
GROUP BY e.EnrollmentID, s.StudentName, c.CourseName
ORDER BY AverageScore DESC
LIMIT 5;

-- Q7. Low performers
SELECT
    s.StudentName,
    c.CourseName,
    ROUND(AVG(ar.MarksObtained),2) AS AverageScore
FROM Enrollment e
JOIN Student s ON e.StudentID = s.StudentID
JOIN Batch b ON e.BatchID = b.BatchID
JOIN Course c ON b.CourseID = c.CourseID
JOIN AssessmentResult ar ON e.EnrollmentID = ar.EnrollmentID
GROUP BY e.EnrollmentID, s.StudentName, c.CourseName
HAVING AverageScore < 60
ORDER BY AverageScore ASC;

-- Q8. Course-wise performance analysis
SELECT
    c.CourseName,
    COUNT(DISTINCT e.StudentID) AS TotalStudents,
    ROUND(AVG(ar.MarksObtained),2) AS AverageScore,
    ROUND(MAX(ar.MarksObtained),2) AS HighestScore,
    ROUND(MIN(ar.MarksObtained),2) AS LowestScore
FROM Course c
JOIN Batch b ON c.CourseID = b.CourseID
JOIN Enrollment e ON b.BatchID = e.BatchID
JOIN AssessmentResult ar ON e.EnrollmentID = ar.EnrollmentID
GROUP BY c.CourseID, c.CourseName
ORDER BY AverageScore DESC;

-- Q9. Performance ranking using a window function
SELECT
    StudentName,
    CourseName,
    AverageScore,
    RANK() OVER (ORDER BY AverageScore DESC) AS PerformanceRank
FROM (
    SELECT
        s.StudentName,
        c.CourseName,
        ROUND(AVG(ar.MarksObtained),2) AS AverageScore
    FROM Enrollment e
    JOIN Student s ON e.StudentID = s.StudentID
    JOIN Batch b ON e.BatchID = b.BatchID
    JOIN Course c ON b.CourseID = c.CourseID
    JOIN AssessmentResult ar ON e.EnrollmentID = ar.EnrollmentID
    GROUP BY e.EnrollmentID, s.StudentName, c.CourseName
) AS StudentScores
ORDER BY PerformanceRank;

-- Q10. Complete progress report from the view
SELECT *
FROM StudentProgressView
ORDER BY AverageScore DESC;

-- Q11. Ranked progress report using the view
SELECT
    StudentName,
    CourseName,
    AttendancePercentage,
    AverageScore,
    RANK() OVER (ORDER BY AverageScore DESC) AS PerformanceRank
FROM StudentProgressView
ORDER BY PerformanceRank;

-- ============================================================
-- END OF TRAINPRO PROJECT SCRIPT
-- ============================================================
