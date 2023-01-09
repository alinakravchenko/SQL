USE Lesson6;
GO
--1. Вывести номера корпусов, если суммарный фонд финансирования расположенных в них кафедр превышает 100000.
--SELECT  [Departments].building, SUM([Departments].financing)
--From [Departments]
--GROUP BY building
--HAVING SUM([Departments].financing)>10000


--2. Вывести названия групп 5-го курса кафедры “Software Development”, которые имеют более 10 пар в первую неделю.
--SELECT [Groups].name
--FROM [Groups]
--Join [Departments]
--On	Groups.DepartmentId=[Departments].id 
--	AND [Departments].name='Software Development'
--	AND [Groups].year=5


--3. Вывести названия групп, имеющих рейтинг (средний рейтинг всех студентов группы) больше, чем рейтинг группы “D221”.
--SELECT G.[name]
--FROM Students AS S, Groups AS G, GroupsStudents AS GS
--WHERE S.id = GS.studentId AND G.id = GS.groupId
--GROUP BY G.[name]
--HAVING AVG(S.rating) > (SELECT AVG(rating) FROM Students WHERE id IN (SELECT studentId FROM GroupsStudents WHERE groupId = (SELECT id FROM Groups WHERE [name] = 'D221')));


--4. Вывести фамилии и имена преподавателей, ставка которых выше средней ставки профессоров.
--SELECT [Teachers].name,[Teachers].surname
--FROM[Teachers]
--WHERE [Teachers].salary>
--	(SELECT AVG([Teachers].salary)
--	FROM[Teachers] 
--	WHERE [Teachers].isProfessor='True')


--5. Вывести названия групп, у которых больше одного куратора.
--SELECT Groups.Name, COUNT(GroupsCurators.GroupId)
--FROM Groups
--JOIN GroupsCurators ON GroupsCurators.GroupId = Groups.Id 
--GROUP BY Groups.Name 
--HAVING COUNT(GroupsCurators.GroupId) > 1 


--6. Вывести названия групп, имеющих рейтинг (средний рейтинг всех студентов группы) меньше, чем минимальный рейтинг групп 5-го курса.
--Это задание не слелала, это лишь моя попытка
--SELECT G.Name
--FROM Students AS S, Groups AS G, GroupsStudents AS GS
--WHERE S.id = GS.studentId AND G.id = GS.groupId
--GROUP BY G.Name
--HAVING AVG((S.rating) < (SELECT MIN(rating) FROM Students WHERE id IN (SELECT studentId FROM GroupsStudents WHERE groupId = (SELECT id FROM Groups WHERE [year] = 5)))




--7. Вывести названия факультетов, суммарный фонд финансирования кафедр которых больше суммарного фонда финансирования кафедр факультета “Computer Science”.
--SELECT F.Name 
--FROM Faculties AS F, Departments AS D
--WHERE F.id = D.facultyId
--GROUP BY F.[name] 
--HAVING SUM(D.financing) > (SELECT SUM(financing) FROM Departments WHERE facultyId = (SELECT id FROM Faculties WHERE [name] = 'Computer Science'));

--8. Вывести названия дисциплин и полные имена преподавателей, читающих наибольшее количество лекций по ним.
--SELECT S.Name AS 'Subject name', T.Name + ' ' + T.surname AS 'Teachers full name'
--FROM Subjects AS S, Teachers AS T, Lectures AS L 
--WHERE T.id = L.teacherId AND S.id = L.subjectId 
--AND T.id IN (SELECT teacherId
--FROM  Lectures
--GROUP BY teacherId
--HAVING COUNT(subjectId) > 1);

--9. Вывести название дисциплины, по которому читается меньше всего лекций.
--SELECT S.Name AS 'Subject name'
--FROM Subjects AS S, Teachers AS T, Lectures AS L 
--WHERE T.id = L.teacherId AND S.id = L.subjectId 
--AND S.id IN (SELECT subjectId
--FROM  Lectures
--GROUP BY subjectId
--HAVING COUNT(teacherId) = MIN(teacherId));

--10. Вывести количество студентов и читаемых дисциплин на кафедре “Software Development”.
--SELECT  COUNT( DISTINCT [Students].name)AS Количество_студентов ,COUNT( DISTINCT [Subjects].name) AS Количество_дисциплин
--FROM[Departments]
--FULL Join [Groups]
--ON [Departments].id=[Groups].DepartmentId
--FULL JOIN[groupsStudents]
--ON[Groups].Id=[groupsStudents].groupId
--FULL JOIN[Students]
--ON [Students].Id=[groupsStudents].studentId
--FULL JOIN[GroupsLectures]
--ON [GroupsLectures].groupId=[Groups].Id
--FULL JOIN[Lectures]
--ON[Lectures].Id=[GroupsLectures].lectureId
--FULL JOIN[Subjects]
--ON[Subjects].Id=[Lectures].subjectId 
--WHERE [Departments].name='Software Development' 