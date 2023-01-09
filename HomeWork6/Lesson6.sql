USE Lesson6;
GO
--1. ������� ������ ��������, ���� ��������� ���� �������������� ������������� � ��� ������ ��������� 100000.
--SELECT  [Departments].building, SUM([Departments].financing)
--From [Departments]
--GROUP BY building
--HAVING SUM([Departments].financing)>10000


--2. ������� �������� ����� 5-�� ����� ������� �Software Development�, ������� ����� ����� 10 ��� � ������ ������.
--SELECT [Groups].name
--FROM [Groups]
--Join [Departments]
--On	Groups.DepartmentId=[Departments].id 
--	AND [Departments].name='Software Development'
--	AND [Groups].year=5


--3. ������� �������� �����, ������� ������� (������� ������� ���� ��������� ������) ������, ��� ������� ������ �D221�.
--SELECT G.[name]
--FROM Students AS S, Groups AS G, GroupsStudents AS GS
--WHERE S.id = GS.studentId AND G.id = GS.groupId
--GROUP BY G.[name]
--HAVING AVG(S.rating) > (SELECT AVG(rating) FROM Students WHERE id IN (SELECT studentId FROM GroupsStudents WHERE groupId = (SELECT id FROM Groups WHERE [name] = 'D221')));


--4. ������� ������� � ����� ��������������, ������ ������� ���� ������� ������ �����������.
--SELECT [Teachers].name,[Teachers].surname
--FROM[Teachers]
--WHERE [Teachers].salary>
--	(SELECT AVG([Teachers].salary)
--	FROM[Teachers] 
--	WHERE [Teachers].isProfessor='True')


--5. ������� �������� �����, � ������� ������ ������ ��������.
--SELECT Groups.Name, COUNT(GroupsCurators.GroupId)
--FROM Groups
--JOIN GroupsCurators ON GroupsCurators.GroupId = Groups.Id 
--GROUP BY Groups.Name 
--HAVING COUNT(GroupsCurators.GroupId) > 1 


--6. ������� �������� �����, ������� ������� (������� ������� ���� ��������� ������) ������, ��� ����������� ������� ����� 5-�� �����.
--��� ������� �� �������, ��� ���� ��� �������
--SELECT G.Name
--FROM Students AS S, Groups AS G, GroupsStudents AS GS
--WHERE S.id = GS.studentId AND G.id = GS.groupId
--GROUP BY G.Name
--HAVING AVG((S.rating) < (SELECT MIN(rating) FROM Students WHERE id IN (SELECT studentId FROM GroupsStudents WHERE groupId = (SELECT id FROM Groups WHERE [year] = 5)))




--7. ������� �������� �����������, ��������� ���� �������������� ������ ������� ������ ���������� ����� �������������� ������ ���������� �Computer Science�.
--SELECT F.Name 
--FROM Faculties AS F, Departments AS D
--WHERE F.id = D.facultyId
--GROUP BY F.[name] 
--HAVING SUM(D.financing) > (SELECT SUM(financing) FROM Departments WHERE facultyId = (SELECT id FROM Faculties WHERE [name] = 'Computer Science'));

--8. ������� �������� ��������� � ������ ����� ��������������, �������� ���������� ���������� ������ �� ���.
--SELECT S.Name AS 'Subject name', T.Name + ' ' + T.surname AS 'Teachers full name'
--FROM Subjects AS S, Teachers AS T, Lectures AS L 
--WHERE T.id = L.teacherId AND S.id = L.subjectId 
--AND T.id IN (SELECT teacherId
--FROM  Lectures
--GROUP BY teacherId
--HAVING COUNT(subjectId) > 1);

--9. ������� �������� ����������, �� �������� �������� ������ ����� ������.
--SELECT S.Name AS 'Subject name'
--FROM Subjects AS S, Teachers AS T, Lectures AS L 
--WHERE T.id = L.teacherId AND S.id = L.subjectId 
--AND S.id IN (SELECT subjectId
--FROM  Lectures
--GROUP BY subjectId
--HAVING COUNT(teacherId) = MIN(teacherId));

--10. ������� ���������� ��������� � �������� ��������� �� ������� �Software Development�.
--SELECT  COUNT( DISTINCT [Students].name)AS ����������_��������� ,COUNT( DISTINCT [Subjects].name) AS ����������_���������
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