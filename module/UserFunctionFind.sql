###################################################
######## FIND BY ID, FIELDS 
###################################################
USE sqlife_1;

##ADDRESS
DROP PROCEDURE IF EXISTS sqlife_1.findAddressByName;
DELIMITER //
CREATE PROCEDURE sqlife_1.findAddressByName(IN FName VARCHAR(200), IN LName VARCHAR(200))
BEGIN 
   SELECT a.*,c.first_name,c.last_name FROM address a RIGHT JOIN contact c ON a.fk_id_contact = c.id where c.first_name = FName and c.last_name=LName; 
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.findAddressByName TO 'user'@'localhost'; 

DROP PROCEDURE IF EXISTS sqlife_1.findAddressById;
DELIMITER //
CREATE PROCEDURE sqlife_1.findAddressById(IN IDs INTEGER)
BEGIN 
   SELECT * FROM sqlife_1.ADDRESS where id = IDs;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.findAddressById TO 'user'@'localhost'; 

##CONTACT
DROP PROCEDURE IF EXISTS sqlife_1.findContactById;
DELIMITER //
CREATE PROCEDURE sqlife_1.findContactById(IN Ids INTEGER)
BEGIN 
	SELECT * FROM contact WHERE id=Ids;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.findContactById TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.findContactByName;
DELIMITER //
CREATE PROCEDURE sqlife_1.findContactByName(IN FName VARCHAR(200), IN LName VARCHAR(200))
BEGIN 
     SELECT * FROM contact WHERE first_name=FName and last_name=LName;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.findContactByName TO 'user'@'localhost';




