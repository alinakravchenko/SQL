use Sales
go
-- 1. ��� ���������� ������ ���������� ������� ���������
-- ������� ����������� � ����� �� ��������. ��� ���������� ���������� ������� ���������� �� ���� ����������
-- � ����������� �������




-- 2. ��� �������� ���������� � ���������� ������� ���������
-- ��� ������� ������� � ������� �������� �������

--CREATE TRIGGER Archive_Sales_Info
--ON Sales_inf AFTER DELETE AS
--INSERT INTO SalesArchive VALUES ((SELECT id FROM Sales_inf
--                                 WHERE BuyerId = BuyerId),
--                                     (SELECT SellerId FROM Sales_inf
--                                         WHERE BuyerId = BuyerId),
--                                     (SELECT BuyerId FROM Sales_inf),
--                                     (SELECT ProductName FROM Sales_inf
--                                         WHERE BuyerId = BuyerId),
--                                     (SELECT SellingPrice FROM Sales_inf
--                                         WHERE BuyerId = BuyerId),
--                                     (SELECT TransactionDate FROM Sales_inf
--                                         WHERE BuyerId = BuyerId))

-- 3. ��� ���������� �������� ������� ��������� ���� �� �� �
-- ������� �����������, ���� ������ ���������� ����������
-- ������ �������� ����������


-- 4. ��� ���������� ���������� ������� ��������� ���� �� ��
-- � ������� ���������, ���� ������ ���������� ����������
-- ������ ���������� ����������

--CREATE TRIGGER Check_Existing_Buyer_As_Customer ON Buyers INSTEAD OF INSERT AS
--    IF(SELECT Name FROM Sellers) = inserted.Name
--    RETURN
--    ELSE INSERT INTO Buyers VALUES (inserted.Id,inserted.Name,inserted.Phone_number,inserted.Email)
--    RETURN;

-- 5. ������� �� ��������� ��������� ���������� � �������
-- ����� �������: ������, �����, �����, �����.

--CREATE TRIGGER Forbid_Sales_About_Fruits ON Sales_inf INSTEAD OF INSERT AS
--    IF inserted.ProductName = N'������' OR
--       inserted.ProductName = N'�����' OR
--       inserted.ProductName = N'�����' OR
--       inserted.ProductName = N'�����'
--    RETURN
--    ELSE INSERT INTO Sales_inf VALUES (inserted.Id,inserted.SellerId,inserted.BuyerId,inserted.ProductName,inserted.SellingPrice,inserted.TransactionDate)
--    RETURN