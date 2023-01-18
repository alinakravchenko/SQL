-- 1. Триггер не позволяющий добавить уже существующий
-- в коллекции альбом


-- 2. Триггер не позволяющий удалять диски группы The Beatles

--CREATE TRIGGER Forbid_Deleting_The_Beatles ON Music_Disk AFTER DELETE AS
--    IF deleted.name = 'The Beatles'
--    ROLLBACK TRANSACTION
--    RETURN;

-- 3. При удалении диска триггер переносит информацию об
-- удаленном диске в таблицу «Архив»

--CREATE TRIGGER Archive_Deleted_Disks
--ON Music_Disk AFTER DELETE AS
--INSERT INTO MusicDiskArchive VALUES ((SELECT music_disk_id FROM deleted),
--                                     (SELECT name FROM deleted),
--                                     (SELECT release_date FROM deleted),
--                                     (SELECT genre_id FROM deleted),
--                                     (SELECT singer_id FROM deleted),
--                                     (SELECT publisher_id FROM deleted))

-- 4. Триггер не позволяющий добавлять в коллекцию диски
-- музыкального стиля «Dark Power Pop».

--CREATE TRIGGER Forbid_Add_Dark_Power_Pop ON Music_Disk AFTER INSERT AS
--    SELECT G.genre_id FROM Genre G
--    WHERE G.name = 'Dark Power Pop'
--    IF  inserted.genre_id = genre_id
--    ROLLBACK TRANSACTION
--    RETURN;