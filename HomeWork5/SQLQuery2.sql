--1. ������� ���������� �������������� ������� �Software Development�
--SELECT F.Name AS Faculties, COUNT(DISTINCT T.id) AS QuantityOfPeople
--FROM Subjects AS S, Teachers AS T, Faculties AS F, Departments AS D, Lectures AS L
--WHERE F.Name = 'Software Development' AND S.Id = D.Id AND D.FacultyId = F.Id AND L.TeacherId = T.Id AND L.SubjectId = S.Id GROUP BY F.Name

--2. ������� ���������� ������, ������� ������ ������������� �Dave McQueen�
--SELECT T.Surname + ' ' + T.Name AS Teachers, COUNT(L.id) AS NumberOfLectures
--FROM Teachers AS T, Lectures AS L
--WHERE T.Surname = 'McQueen' AND T.Name = 'Dave' AND L.TeacherId=T.Id
--GROUP BY T.Surname, T.Name

--3. ������� ���������� �������, ���������� � ��������� �D201�
--SELECT L.LectureRoom AS LecturesRoom, COUNT(L.Id) AS NumberOfLectures
--FROM Lectures AS L
--WHERE L.LectureRoom = 'D201' GROUP BY L.LectureRoom

--4. ������� �������� ��������� � ���������� ������, ���������� � ���
--SELECT L.LectureRoom AS LecturesRoom, COUNT(L.Subjectid) AS NumberOfLectures
--FROM Lectures AS L, Subjects AS S
--WHERE L.SubjectId=S.Id GROUP BY L.LectureRoom

--5. ������� ���������� ���������, ���������� ������ ������������� �Jack Underhill�
--SELECT T.Surname + ' ' + T.Name AS Teacher, G.Name AS Groups, COUNT(DISTINCT S.Id) AS QuantityOfStudents
--FROM Teachers AS T, GroupsLectures AS GL, Lectures AS L, Groups AS G, Subjects AS S
--WHERE S.Id = G.Id AND GL.GroupId = G.Id AND GL.LectureId = L.Id AND L.TeacherId = T.Id
--AND T.Surname = 'Underhill' AND T.Name = 'Jack'
--GROUP BY T.Surname, T.Name, G.Name

--6. ������� ������� ������ �������������� ���������� �Computer Science�
--SELECT F.Name AS Faculty, AVG(DISTINCT T.Salary) AS AVG_RATE
--FROM Faculties AS F, Teachers AS T, Subjects AS S, Departments AS D, Lectures AS L
--WHERE F.Name = 'Computer Science' AND L.SubjectId = S.Id AND L.TeacherId = T.Id AND S.Id = D.Id AND D.FacultyId = F.Id 
--GROUP BY F.Name

--7. ������� ����������� � ������������ ���������� ��������� ����� ���� �����

--8. ������� ������� ���� �������������� ������
--SELECT AVG(D.Financing) AS �������_����_��������������
--FROM Departments AS D

--9. ������� ������ ����� �������������� � ���������� �������� ��� ���������
--SELECT T.Surname + ' ' + T.Name AS Teachers, COUNT(DISTINCT S.id) AS ����������_��������_���������
--FROM Teachers AS T, Subjects AS S, Lectures AS L
--WHERE L.TeacherId=T.Id AND L.SubjectId=S.Id
--GROUP BY T.Surname+' ' + T.Name

--10. ������� ���������� ������ � ������ ���� ������.
--SELECT GL.DayOfWeek AS Day_Of_Week, COUNT(*) AS ����������_������
--FROM GroupsLectures AS GL GROUP BY GL.DayOfWeek

--11. ������� ������ ��������� � ���������� ������, ��� ������ � ��� ��������.
--SELECT L.LectureRoom AS Lecture_Room, COUNT(DISTINCT D.id) AS ����������_������
--FROM Lectures AS L, Subjects AS S, Departments AS D
--WHERE L.SubjectId=S.Id AND S.Id = D.Id
--GROUP BY L.LectureRoom

--12.������� �������� ����������� � ���������� ���������, ������� �� ��� ��������.
--SELECT F.Name AS Faculties, COUNT(S.id) AS ����������_���������
--FROM Faculties AS F, Departments AS D, Subjects AS S
--WHERE S.Id=D.id AND D.FacultyId=F.Id
--GROUP BY F.Name

--13. ������� ���������� ������ ��� ������ ���� �������������-���������.
--SELECT T.Surname + ' ' + T.Name AS Teachers, L.LectureRoom AS Lecture_Room, COUNT(DISTINCT L.Subjectid) AS ����������_������
--FROM Teachers AS T, Lectures AS L, Subjects AS S
--GROUP BY T.Surname + ' ' + T.Name, L.LectureRoom
--ORDER BY Teachers





