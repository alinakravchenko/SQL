--1. Вывести количество преподавателей кафедры “Software Development”
--SELECT F.Name AS Faculties, COUNT(DISTINCT T.id) AS QuantityOfPeople
--FROM Subjects AS S, Teachers AS T, Faculties AS F, Departments AS D, Lectures AS L
--WHERE F.Name = 'Software Development' AND S.Id = D.Id AND D.FacultyId = F.Id AND L.TeacherId = T.Id AND L.SubjectId = S.Id GROUP BY F.Name

--2. Вывести количество лекций, которые читает преподаватель “Dave McQueen”
--SELECT T.Surname + ' ' + T.Name AS Teachers, COUNT(L.id) AS NumberOfLectures
--FROM Teachers AS T, Lectures AS L
--WHERE T.Surname = 'McQueen' AND T.Name = 'Dave' AND L.TeacherId=T.Id
--GROUP BY T.Surname, T.Name

--3. Вывести количество занятий, проводимых в аудитории “D201”
--SELECT L.LectureRoom AS LecturesRoom, COUNT(L.Id) AS NumberOfLectures
--FROM Lectures AS L
--WHERE L.LectureRoom = 'D201' GROUP BY L.LectureRoom

--4. Вывести названия аудиторий и количество лекций, проводимых в них
--SELECT L.LectureRoom AS LecturesRoom, COUNT(L.Subjectid) AS NumberOfLectures
--FROM Lectures AS L, Subjects AS S
--WHERE L.SubjectId=S.Id GROUP BY L.LectureRoom

--5. Вывести количество студентов, посещающих лекции преподавателя “Jack Underhill”
--SELECT T.Surname + ' ' + T.Name AS Teacher, G.Name AS Groups, COUNT(DISTINCT S.Id) AS QuantityOfStudents
--FROM Teachers AS T, GroupsLectures AS GL, Lectures AS L, Groups AS G, Subjects AS S
--WHERE S.Id = G.Id AND GL.GroupId = G.Id AND GL.LectureId = L.Id AND L.TeacherId = T.Id
--AND T.Surname = 'Underhill' AND T.Name = 'Jack'
--GROUP BY T.Surname, T.Name, G.Name

--6. Вывести среднюю ставку преподавателей факультета “Computer Science”
--SELECT F.Name AS Faculty, AVG(DISTINCT T.Salary) AS AVG_RATE
--FROM Faculties AS F, Teachers AS T, Subjects AS S, Departments AS D, Lectures AS L
--WHERE F.Name = 'Computer Science' AND L.SubjectId = S.Id AND L.TeacherId = T.Id AND S.Id = D.Id AND D.FacultyId = F.Id 
--GROUP BY F.Name

--7. Вывести минимальное и максимальное количество студентов среди всех групп

--8. Вывести средний фонд финансирования кафедр
--SELECT AVG(D.Financing) AS Средний_Фонд_Финансирования
--FROM Departments AS D

--9. Вывести полные имена преподавателей и количество читаемых ими дисциплин
--SELECT T.Surname + ' ' + T.Name AS Teachers, COUNT(DISTINCT S.id) AS Количество_Читаемых_Дисциплин
--FROM Teachers AS T, Subjects AS S, Lectures AS L
--WHERE L.TeacherId=T.Id AND L.SubjectId=S.Id
--GROUP BY T.Surname+' ' + T.Name

--10. Вывести количество лекций в каждый день недели.
--SELECT GL.DayOfWeek AS Day_Of_Week, COUNT(*) AS Количество_Лекций
--FROM GroupsLectures AS GL GROUP BY GL.DayOfWeek

--11. Вывести номера аудиторий и количество кафедр, чьи лекции в них читаются.
--SELECT L.LectureRoom AS Lecture_Room, COUNT(DISTINCT D.id) AS Количество_Кафедр
--FROM Lectures AS L, Subjects AS S, Departments AS D
--WHERE L.SubjectId=S.Id AND S.Id = D.Id
--GROUP BY L.LectureRoom

--12.Вывести названия факультетов и количество дисциплин, которые на них читаются.
--SELECT F.Name AS Faculties, COUNT(S.id) AS Количество_Дисциплин
--FROM Faculties AS F, Departments AS D, Subjects AS S
--WHERE S.Id=D.id AND D.FacultyId=F.Id
--GROUP BY F.Name

--13. Вывести количество лекций для каждой пары преподаватель-аудитория.
--SELECT T.Surname + ' ' + T.Name AS Teachers, L.LectureRoom AS Lecture_Room, COUNT(DISTINCT L.Subjectid) AS Количество_Лекций
--FROM Teachers AS T, Lectures AS L, Subjects AS S
--GROUP BY T.Surname + ' ' + T.Name, L.LectureRoom
--ORDER BY Teachers





