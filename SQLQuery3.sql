USE Lesson4;
GO

--1. Вывести все возможные пары строк преподавателей и групп.
--SELECT G.Name as GroupName, T.Name as TeacherName
--FROM Groups as G, Teachers as T 


--2. Вывести названия факультетов, фонд финансирования
--кафедр которых превышает фонд финансирования факультета.
--SELECT D.Name 
--FROM Departments AS D, Faculties AS F
--WHERE D.FacultyId = F.id AND D.Financing > F.Financing


--3. Вывести фамилии кураторов групп и названия групп, которые они курируют.
--SELECT C.Surname as Curator, G.Name AS GroupName
--FROM Curators AS C, Groups AS G, GroupsCurators AS GC
--WHERE C.Id = GC.CuratorId AND G.Id = GC.GroupId
 

--4. Вывести имена и фамилии преподавателей, которые читают лекции у группы “B115”.
--SELECT T.Surname + ' ' + T.Name AS Преподаватель, G.Name AS Группа
--FROM Groups AS G, Teachers AS T, Lectures AS L, GroupsLectures AS GL
--WHERE GL.GroupId = G.Id AND GL.LectureId = L.Id AND L.TeacherId=T.Id AND G.Name='B115'


--5. Вывести фамилии преподавателей и названия факультетов на которых они читают лекции.
--SELECT T.Surname AS Преподаватель,F.Name AS Факультет
--FROM Teachers AS T
--JOIN Lectures AS L ON T.ID = L.TeacherID
--JOIN GroupsLectures AS GL ON L.ID = GL.LectureID
--JOIN Groups AS GR ON GL.GroupID = GR.ID
--JOIN Departments AS D ON GR.DepartmentID = D.ID
--JOIN Faculties AS F ON D.FacultyID = F.ID


--6. Вывести названия кафедр и названия групп, которые к ним относятся.
--SELECT D.Name AS Кафедра, G.Name AS Группа
--FROM Groups AS G, Departments AS D
--WHERE G.DepartmentId=D.Id;


--7. Вывести названия дисциплин, которые читает преподаватель “Samantha Adams”.
--SELECT S.Name AS Дисциплина, T.Surname + ' ' + T.Name AS Преподаватель
--FROM Subjects AS S, Teachers AS T, Lectures AS L
--WHERE L.SubjectId = S.Id AND L.TeacherId = T.Id AND T.Name = 'Samanta' AND T.Surname = 'Adams';

--8. Вывести названия кафедр, на которых читается дисциплина “Introduction to logistics”.
--SELECT D.Name AS Дисциплина, F.Name AS Кафедра
--FROM Departments AS D, Faculties AS F
--WHERE D.FacultyId = F.Id AND D.Name = 'Introduction to logistics';


--9. Вывести названия групп, которые относятся к факультету “Computer Science”.
--SELECT G.Name AS Группа, D.Name AS Кафедра, F.Name AS Факультет
--FROM Groups AS G, Departments AS D, Faculties AS F
--WHERE F.Name = 'Computer Science' AND G.DepartmentId = D.Id AND D.FacultyId = F.Id;

--10. Вывести названия групп 5-го курса, а также название факультетов, к которым они относятся.
--SELECT G.Name AS Группа, G.Year AS Курс, F.Name AS Факультет
--FROM Groups AS G, Faculties AS F, Departments AS D
--WHERE G.Year = 5 AND G.DepartmentId = D.Id AND D.FacultyId = F.Id


--11. Вывести полные имена преподавателей и лекции, которые они читают (названия дисциплин и групп), причем отобрать
--только те лекции, которые читаются в аудитории “B103”
--SELECT T.Surname + ' ' + T.Name AS Преподаватель, S.Name AS Дисциплина, G.Name AS Группа, L.LectureRoom AS Аудитория
--FROM Teachers AS T, Lectures AS L, Groups AS G, Subjects AS S, GroupsLectures AS GL
--WHERE L.LectureRoom = 'B103' AND L.TeacherId=T.Id AND GL.GroupId = G.Id AND GL.LectureId=L.Id AND L.SubjectId=S.Id;