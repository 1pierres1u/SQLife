####################################################
## CREATE USERS
####################################################
DROP USER IF EXISTS 'user'@'localhost';
CREATE USER IF NOT EXISTS 'user'@'localhost' IDENTIFIED BY '123456789';

GRANT SELECT, INSERT, DELETE ON sqlife_1.* TO 'user'@'localhost';
GRANT SELECT ON backup_sqlife_1.* TO 'user'@'localhost';

GRANT EXECUTE ON PROCEDURE backupData TO 'user'@'localhost';

