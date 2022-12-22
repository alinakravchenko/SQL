USE Lesson4;
GO

--1. ������� ��� ��������� ���� ����� �������������� � �����.
--SELECT G.Name as GroupName, T.Name as TeacherName
--FROM Groups as G, Teachers as T 


--2. ������� �������� �����������, ���� ��������������
--������ ������� ��������� ���� �������������� ����������.
--SELECT D.Name 
--FROM Departments AS D, Faculties AS F
--WHERE D.FacultyId = F.id AND D.Financing > F.Financing


--3. ������� ������� ��������� ����� � �������� �����, ������� ��� ��������.
--SELECT C.Surname as Curator, G.Name AS GroupName
--FROM Curators AS C, Groups AS G, GroupsCurators AS GC
--WHERE C.Id = GC.CuratorId AND G.Id = GC.GroupId
 

--4. ������� ����� � ������� ��������������, ������� ������ ������ � ������ �B115�.
--SELECT T.Surname + ' ' + T.Name AS �������������, G.Name AS ������
--FROM Groups AS G, Teachers AS T, Lectures AS L, GroupsLectures AS GL
--WHERE GL.GroupId = G.Id AND GL.LectureId = L.Id AND L.TeacherId=T.Id AND G.Name='B115'


--5. ������� ������� �������������� � �������� ����������� �� ������� ��� ������ ������.
--SELECT T.Surname AS �������������,F.Name AS ���������
--FROM Teachers AS T
--JOIN Lectures AS L ON T.ID = L.TeacherID
--JOIN GroupsLectures AS GL ON L.ID = GL.LectureID
--JOIN Groups AS GR ON GL.GroupID = GR.ID
--JOIN Departments AS D ON GR.DepartmentID = D.ID
--JOIN Faculties AS F ON D.FacultyID = F.ID


--6. ������� �������� ������ � �������� �����, ������� � ��� ���������.
--SELECT D.Name AS �������, G.Name AS ������
--FROM Groups AS G, Departments AS D
--WHERE G.DepartmentId=D.Id;


--7. ������� �������� ���������, ������� ������ ������������� �Samantha Adams�.
--SELECT S.Name AS ����������, T.Surname + ' ' + T.Name AS �������������
--FROM Subjects AS S, Teachers AS T, Lectures AS L
--WHERE L.SubjectId = S.Id AND L.TeacherId = T.Id AND T.Name = 'Samanta' AND T.Surname = 'Adams';

--8. ������� �������� ������, �� ������� �������� ���������� �Introduction to logistics�.
--SELECT D.Name AS ����������, F.Name AS �������
--FROM Departments AS D, Faculties AS F
--WHERE D.FacultyId = F.Id AND D.Name = 'Introduction to logistics';


--9. ������� �������� �����, ������� ��������� � ���������� �Computer Science�.
--SELECT G.Name AS ������, D.Name AS �������, F.Name AS ���������
--FROM Groups AS G, Departments AS D, Faculties AS F
--WHERE F.Name = 'Computer Science' AND G.DepartmentId = D.Id AND D.FacultyId = F.Id;

--10. ������� �������� ����� 5-�� �����, � ����� �������� �����������, � ������� ��� ���������.
--SELECT G.Name AS ������, G.Year AS ����, F.Name AS ���������
--FROM Groups AS G, Faculties AS F, Departments AS D
--WHERE G.Year = 5 AND G.DepartmentId = D.Id AND D.FacultyId = F.Id


--11. ������� ������ ����� �������������� � ������, ������� ��� ������ (�������� ��������� � �����), ������ ��������
--������ �� ������, ������� �������� � ��������� �B103�
--SELECT T.Surname + ' ' + T.Name AS �������������, S.Name AS ����������, G.Name AS ������, L.LectureRoom AS ���������
--FROM Teachers AS T, Lectures AS L, Groups AS G, Subjects AS S, GroupsLectures AS GL
--WHERE L.LectureRoom = 'B103' AND L.TeacherId=T.Id AND GL.GroupId = G.Id AND GL.LectureId=L.Id AND L.SubjectId=S.Id;