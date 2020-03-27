USE sqlife_1;
SET GLOBAL event_scheduler = ON;

DROP PROCEDURE IF EXISTS sqlife_1.backupController;
DELIMITER //
CREATE PROCEDURE sqlife_1.backupController()
BEGIN 
  DECLARE c INTEGER  DEFAULT 0;
  SELECT COUNT(*) INTO c FROM sqlife_1.table_tracker where tabl <> 'backup';
  IF C > 10 THEN
     CALL sqlife_1.BackupData();
     DELETE FROM sqlife_1.table_tracker where tabl <> 'backup';
     INSERT INTO sqlife_1.table_tracker(tabl,operation) values('backup','insert');
  END IF;
END //
DELIMITER ;


DROP EVENT IF EXISTS sqlife_1.backupEvent;
CREATE EVENT sqlife_1.backupEvent 
ON SCHEDULE EVERY 1 WEEK 
DO 
  CALL sqlife_1.backupController();

 



 
