use Sport_Shop1
go
-- 1. При добавлении нового товара триггер проверяет его наличие на складе, если такой товар есть и новые данные о
-- товаре совпадают с уже существующими данными, вместо
-- добавления происходит обновление информации о количестве товара

--CREATE TRIGGER Check_Update_Goods_Quantitys
--ON Goods AFTER INSERT
--AS
--UPDATE Goods
--SET quantity = + (SELECT quantity FROM inserted)
--WHERE name = (SELECT name FROM inserted) AND
--      type = (SELECT type FROM inserted) AND
--      production_price = (SELECT production_price FROM inserted) AND
--      manufacturer = (SELECT manufacturer FROM inserted)

--    SET IDENTITY_INSERT Goods ON
--    INSERT INTO Goods VALUES (6,'MyHat','Hat',45,2000,3000,'USA')

-- 2. При увольнении сотрудника триггер переносит информацию
-- об уволенном сотруднике в таблицу «Архив сотрудников»

--CREATE TRIGGER Archive_Deleted_Employee
--ON Employers AFTER DELETE
--AS
--INSERT INTO EmployersArchive VALUES ((SELECT id FROM deleted),
--                                     (SELECT name FROM deleted),
--                                     (SELECT position FROM deleted),
--                                     (SELECT enroll_date FROM deleted),
--                                     (SELECT gender FROM deleted),
--                                     (SELECT salary FROM deleted))


-- 3. Триггер запрещает добавлять нового продавца, если количество существующих продавцов больше 6.

--CREATE TRIGGER Set_Limit_Of_Six_Employee
--    ON Employers AFTER INSERT AS
--    IF 6 > (SELECT COUNT(Employers.id) FROM Employers)
--    PRINT 'There are already more than 6 employers'
--    DELETE INSERTED FROM Employers
--    WHERE Employers.id = inserted.id