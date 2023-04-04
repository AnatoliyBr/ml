SELECT * FROM students

SELECT students.* FROM students
SELECT students.birthdate FROM students
SELECT studentid, address FROM students
SELECT students.studentid, students.address FROM students

SELECT DISTINCT groupcode FROM students

SELECT * FROM students ORDER BY studentname DESC
SELECT * FROM students ORDER BY groupcode DESC, studentname
SELECT studentname, groupcode FROM students ORDER BY groupcode DESC, studentname
SELECT studentname, groupcode FROM students ORDER BY studentid

SELECT studentname as name, groupcode as code FROM students

SELECT studentname as name, substr(groupcode,1,1) as faculty from students
SELECT studentname as name, substr(groupcode,1,1) as faculty,
'student' as status from students

SELECT COUNT(*) FROM Students
SELECT COUNT(*) AS Number_Of_Students FROM Students

SELECT MAX(BirthDate) FROM Students
SELECT COUNT(*) FROM Students WHERE GroupCode='M2020_1'

SELECT COUNT(DISTINCT GroupCode) FROM Students

SELECT COUNT(*) FROM Students GROUP BY GroupCode
SELECT GroupCode, COUNT(*) FROM Students GROUP BY GroupCode

SELECT GroupCode FROM Students
GROUP BY GroupCode
HAVING COUNT(*) < 8

SELECT GroupCode FROM Students
WHERE StudentID < 345577
GROUP BY GroupCode
HAVING COUNT(*) < 8

SELECT StudentName FROM Students
WHERE BirthDate = (SELECT MAX(BirthDate) FROM Students)

SELECT GroupCode FROM St_Group
WHERE Specialization = 'Nanotechnology'

SELECT StudentName FROM Students
WHERE GroupCode = (SELECT GroupCode FROM St_Group
WHERE Specialization = 'Nanotechnology')

SELECT StudentName FROM Students
WHERE GroupCode IN (SELECT GroupCode FROM St_Group
WHERE Specialization = 'Nanotechnology'
OR Specialization = 'Health Research')

SELECT StudentName, GroupCode,
(SELECT Specialization FROM St_Group
WHERE St_Group.GroupCode=Students.GroupCode) FROM Students

SELECT StudentID, StudentName FROM Students
WHERE EXISTS (SELECT * FROM PHONE_LIST WHERE
Students.StudentID=PHONE_LIST.StudentID)

SELECT StudentID, StudentName FROM Students
WHERE 2 = ANY (SELECT Grade FROM EXAM_RESULT WHERE
Students.StudentID=EXAM_RESULT.StudentID)

SELECT StudentId, StudentName FROM STUDENTS
WHERE BirthDate < '01/01/1999'
UNION
SELECT StudentId, StudentName FROM STUDENTS
WHERE BirthDate > '06/01/1998'

SELECT TeacherId AS Id, TeacherName AS Name,
'Teacher' AS Status FROM Teacher
UNION
SELECT StudentId AS Id, StudentName AS Name,
'Student' AS Status FROM Students

SELECT * FROM Students JOIN PHONE_LIST
ON Students.StudentId = PHONE_LIST.StudentId

SELECT * FROM Students, PHONE_LIST
WHERE Students.StudentId = PHONE_LIST.StudentId

SELECT a.StudentName, b.StudentName FROM STUDENTS
a JOIN STUDENTS b
ON
a.StudentId <> b.StudentId
ORDER BY a.StudentName, b.StudentName

SELECT ExamSheetId, CourseTitle, TeacherName, ClassRoom, ExamDate
FROM EXAM_SHEET JOIN COURSE
ON EXAM_SHEET.CourseId = COURSE.CourseId
JOIN TEACHER ON EXAM_SHEET.TeacherId = TEACHER.TeacherId