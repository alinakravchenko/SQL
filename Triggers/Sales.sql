use Sales
go
-- 1. При добавлении нового покупателя триггер проверяет
-- наличие покупателей с такой же фамилией. При нахождении совпадения триггер записывает об этом информацию
-- в специальную таблицу




-- 2. При удалении информации о покупателе триггер переносит
-- его историю покупок в таблицу «История покупок»

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

-- 3. При добавлении продавца триггер проверяет есть ли он в
-- таблице покупателей, если запись существует добавление
-- нового продавца отменяется


-- 4. При добавлении покупателя триггер проверяет есть ли он
-- в таблице продавцов, если запись существует добавление
-- нового покупателя отменяется

--CREATE TRIGGER Check_Existing_Buyer_As_Customer ON Buyers INSTEAD OF INSERT AS
--    IF(SELECT Name FROM Sellers) = inserted.Name
--    RETURN
--    ELSE INSERT INTO Buyers VALUES (inserted.Id,inserted.Name,inserted.Phone_number,inserted.Email)
--    RETURN;

-- 5. Триггер не позволяет вставлять информацию о продаже
-- таких товаров: яблоки, груши, сливы, кинза.

--CREATE TRIGGER Forbid_Sales_About_Fruits ON Sales_inf INSTEAD OF INSERT AS
--    IF inserted.ProductName = N'Яблоки' OR
--       inserted.ProductName = N'Груши' OR
--       inserted.ProductName = N'Сливы' OR
--       inserted.ProductName = N'Кинза'
--    RETURN
--    ELSE INSERT INTO Sales_inf VALUES (inserted.Id,inserted.SellerId,inserted.BuyerId,inserted.ProductName,inserted.SellingPrice,inserted.TransactionDate)
--    RETURN