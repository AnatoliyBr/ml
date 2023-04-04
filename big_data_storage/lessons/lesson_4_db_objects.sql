SELECT StudentId, StudentName,
'1 year student' AS Status FROM Students

SELECT StudentId,
StudentName || ' 1 year student' AS Status FROM Students

SELECT StudentId, SUM(Grade)*100/5 AS Total
FROM Exam_Result GROUP BY StudentId

SELECT * FROM Students WHERE GroupCode <> 'M2020_1'

SELECT * FROM Students
WHERE Address LIKE '% Station Road%' AND Birthdate >= '01/01/1999'

SELECT * FROM Exam_Sheet
MINUS
SELECT * FROM Exam_Sheet WHERE NOT ClassRoom = 2411

SELECT StudentId FROM EXAM_RESULT GROUP BY StudentId
HAVING MIN(Grade) >= 4 AND COUNT(*) > 1

SELECT StudentName, GroupCode FROM Students
ORDER BY StudentName || GroupCode

SELECT DISTINCT examdate FROM exam_sheet
WHERE groupcode LIKE 'B%'

SELECT COUNT(examdate) as Number_of_exams FROM exam_sheet
WHERE groupcode LIKE 'B%' AND classroom = 2410

SELECT 7/2.0 FROM DUAL
SELECT 7/2 FROM DUAL
SELECT '1' + 3 FROM DUAL

CAST ('5' AS INTEGER);
CAST (5 AS decimal(3,2));

SELECT 'Номер зачетки - ' || CAST (StudentId AS CHAR(7))
FROM Students

SELECT CAST (5 AS CHAR(7)) FROM DUAL;

SELECT sysdate FROM dual

SELECT TO_date('28/02/2022 18:24', 'DD/MM/YYYY HH24:MI') FROM DUAL

SELECT TO_char(date_field, 'YYYY-MM-DD') FROM DUAL

SELECT TO_DATE('28/02/2019', 'DD/MM/YYYY') + 1 FROM DUAL

SELECT MAX(BirthDate) - MIN(BirthDate) FROM Students

SELECT EXTRACT(MONTH FROM SYSDATE) FROM DUAL

SELECT * FROM STUDENTS WHERE EXTRACT(MONTH FROM BirthDate) = 5

SELECT * FROM STUDENTS WHERE EXTRACT(MONTH FROM BirthDate) = 5
ORDER BY EXTRACT(DAY FROM BirthDate)

SELECT ROUND(AVG(Grade)), StudentId
FROM EXAM_RESULT GROUP BY StudentId

SELECT TRUNC(AVG(Grade)), StudentId
FROM EXAM_RESULT GROUP BY StudentId

SELECT CEIL(AVG(Grade)), StudentId
FROM EXAM_RESULT GROUP BY StudentId

SELECT ASCII('A') FROM DUAL

SELECT CHR(66) FROM DUAL

SELECT SUBSTR(StudentName, 6, 5) FROM Students
WHERE StudentId = 345569

SELECT StudentName,
SUBSTR(StudentName,INSTR(StudentName, ' ')) || ' ' ||
SUBSTR(StudentName, 1, INSTR(StudentName, ' ')) FROM Students

SELECT studentname, Extract(year FROM birthdate) AS birth_year
FROM students WHERE birthdate IS NOT NULL ORDER BY studentname

SELECT studentname FROM students WHERE Extract(month FROM birthdate) = Extract(month FROM sysdate)

SELECT UPPER(SUBSTR(StudentName, 1, INSTR(StudentName, ' '))) as upper_name FROM Students ORDER BY birthdate

SELECT studentid, ROUND(AVG(grade), 2) as avg_grade FROM exam_result GROUP BY studentid ORDER BY avg_grade DESC

CREATE VIEW Exam_next_week AS
SELECT ExamSheetId AS ExamID, CourseTitle, TeacherName,
ClassRoom, ExamDate FROM EXAM_SHEET JOIN COURSE
ON EXAM_SHEET.CourseId = COURSE.CourseId
JOIN TEACHER ON EXAM_SHEET.TeacherId =TEACHER.TeacherId
WHERE ExamDate > SYSDATE - 730 AND ExamDate < SYSDATE + 7

SELECT * FROM Exam_next_week

create function GetStudentsList(P_GroupCode in varchar) return varchar
is varTemp varchar(1000);
begin
varTemp:=P_GroupCode || ': ' ;
for rec in (select StudentName FROM Students
where GroupCode = P_GroupCode )
loop
varTemp := varTemp || rec.StudentName || ' , ';
end loop;
return varTemp;
end;

select GetStudentsList (GROUPCODE) from ST_GROUP

create trigger EXAM_SHEET_T
before insert on EXAM_SHEET
for each row
declare
not_on_weekends exception;
begin
    (if to_char(:new.ExamDate, 'DY') = 'SUN') then
    RAISE not_on_weekends; end if;
    exception
    when not_on_weekends then
    raise_application_error(-20324,
    "You can't schedule an exam for Sunday!");
end;

CREATE VIEW V_student AS
SELECT StudentName, GroupCode, StudentId FROM students

CREATE VIEW V_exam_count AS
SELECT classroom, COUNT(*) as exam_count FROM exam_sheet GROUP BY classroom

CREATE INDEX I_StudentName
ON Students(StudentName)

CREATE TABLE customers 
  ( 
     customer_id         INTEGER PRIMARY KEY, 
     cust_first_name     VARCHAR(20) NOT NULL, 
     cust_last_name      VARCHAR(20) NOT NULL, 
     cust_street_address VARCHAR(60) NULL, 
     cust_city           VARCHAR(30) NULL, 
     cust_state          VARCHAR(2) NULL, 
     cust_postal_code    VARCHAR(10) NULL, 
     cust_email          VARCHAR(30) NULL, 
     phone_number        VARCHAR(25) NULL UNIQUE, 
     credit_limit        INTEGER NULL 
  ); 

CREATE INDEX cust_name 
  ON customers (cust_last_name, cust_first_name)