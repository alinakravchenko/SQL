--1. ������� �������� ���������, � ������� ������ ������ ������������� �Edward Hopper�.
--SELECT LR.Name FROM LectureRooms LR
--    INNER JOIN Schedules S on LR.Id = S.LectureRoomId
--    INNER JOIN Lectures L on L.Id = S.LectureId
--    INNER JOIN Teachers T on T.Id = L.TeacherId
--    WHERE T.Name = 'Edward' AND T.Surname = 'Hopper'

--2. ������� ������� �����������, �������� ������ � ������ �F505�.
--SELECT T.Surname FROM Teachers T
--    INNER JOIN Assistants A on T.Id = A.TeacherId
--    INNER JOIN Lectures L on T.Id = L.TeacherId
--    INNER JOIN GroupsLectures GL on L.Id = GL.LectureId
--    INNER JOIN Groups G on G.Id = GL.GroupId
--    WHERE G.Name = 'F505'

--3. ������� ����������, ������� ������ ������������� �Alex Carmack� ��� ����� 5-�� �����.
--SELECT S.Name FROM Subjects S
--    INNER JOIN Lectures L on S.Id = L.SubjectId
--    INNER JOIN Teachers T on T.Id = L.TeacherId
--    INNER JOIN GroupsLectures GL on L.Id = GL.LectureId
--    INNER JOIN Groups G on G.Id = GL.GroupId
--    WHERE T.Name = 'Alex' AND T.Surname = 'Carmack' AND G.Year = 5

--4. ������� ������� ��������������, ������� �� ������ ������ �� �������������.
--SELECT T.Surname FROM Teachers T
--    INNER JOIN Lectures L on T.Id = L.TeacherId
--    INNER JOIN Schedules S on L.Id = S.LectureId
--    WHERE S.DayOfWeek != 1


--5. ������� �������� ���������, � ��������� �� ��������, � ������� ��� ������ � ����� ������ ������ �� ������� ����.
--SELECT LR.Name, LR.Building FROM LectureRooms LR
--    INNER JOIN Schedules S on LR.Id = S.LectureRoomId
--    WHERE S.DayOfWeek != 3 AND S.Week != 2 AND S.Class != 3


--6. ������� ������ ����� �������������� ���������� �Computer Science�, ������� �� �������� ������ ������� �Software Development�.
--SELECT T.Name, T.Surname FROM Teachers T
--    INNER JOIN Lectures L on T.Id = L.TeacherId
--    INNER JOIN GroupsLectures GL on L.Id = GL.LectureId
--    INNER JOIN Groups G on G.Id = GL.GroupId
--    INNER JOIN Departments D on D.Id = G.DepartmentId
--    INNER JOIN GroupsCurators GC on G.Id = GC.GroupId
--    FUll OUTER JOIN Faculties F on F.Name = 'Software Development' AND D.FacultyId = F.Id
--    WHERE D.Name = 'Computer Science'

--7. ������� ������ ������� ���� ��������, ������� ������� � �������� �����������, ������ � ���������.
--SELECT D.Building FROM Departments D
--FULL OUTER JOIN Faculties F on F.Id = D.FacultyId
--INNER JOIN Groups G on D.Id = G.DepartmentId
--INNER JOIN GroupsLectures GL on G.Id = GL.GroupId
--INNER JOIN Lectures L on L.Id = GL.LectureId
--INNER JOIN Schedules S on L.Id = S.LectureId
--FULL OUTER JOIN LectureRooms LR on S.LectureRoomId = LR.Id



--8. ������� ������ ����� �������������� � ��������� �������: ������ �����������, ���������� ���������, �������������, ��������, ����������.

--������ ����� ������� �� ���������

--SELECT T.Name, T.Surname FROM Teachers T
--LEFT JOIN Deans D on T.Id = D.TeacherId
--LEFT JOIN Heads H on T.Id = H.TeacherId
--LEFT JOIN Curators C on T.Id = C.TeacherId
--LEFT JOIN Assistants A on T.Id = A.TeacherId
--ORDER BY D.TeacherId, H.TeacherId, T.Id, C.TeacherId, A.Id, T.Name, T.Surname



--9. ������� ��� ������ (��� ����������), � ������� ������� ������� � ���������� �A311� � �A104� ������� 6.
--SELECT DISTINCT S.DayOfWeek FROM Schedules S
--INNER JOIN LectureRooms LR on LR.Id = S.LectureRoomId
--WHERE LR.Name= 'A311' OR LR.Name = 'A104' AND LR.Building = 6