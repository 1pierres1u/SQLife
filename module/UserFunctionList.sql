###################################################
########  LIST RECORDS
###################################################
USE sqlife_1;

DROP PROCEDURE IF EXISTS sqlife_1.listAddress;
DELIMITER //
CREATE PROCEDURE sqlife_1.listAddress()
BEGIN 
    SELECT * FROM sqlife_1.Address;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.listAddress TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.listContact;
DELIMITER //
CREATE PROCEDURE sqlife_1.listContact()
BEGIN 
    SELECT * FROM sqlife_1.contact;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.listContact TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.listApplication;
DELIMITER //
CREATE PROCEDURE sqlife_1.listApplication()
BEGIN 
     SELECT * FROM sqlife_1.application;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.listApplication TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.listBook;
DELIMITER //
CREATE PROCEDURE sqlife_1.listBook()
BEGIN 
     SELECT * FROM sqlife_1.Book;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.listBook TO 'user'@'localhost';
   

DROP PROCEDURE IF EXISTS sqlife_1.listCompany;
DELIMITER //
CREATE PROCEDURE sqlife_1.listCompany()
BEGIN 
     SELECT * FROM sqlife_1.Company;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.listCompany TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.listCooking;
DELIMITER //
CREATE PROCEDURE sqlife_1.listCooking()
BEGIN 
     SELECT * FROM sqlife_1.Cooking;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.listCooking TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.listFollowUp;
DELIMITER //
CREATE PROCEDURE sqlife_1.listFollowUp()
BEGIN 
     SELECT * FROM sqlife_1.FollowUp;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.listFollowUp TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.listFood;
DELIMITER //
CREATE PROCEDURE sqlife_1.listFood()
BEGIN 
     SELECT * FROM sqlife_1.Food;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.listFood TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.listJobPage;
DELIMITER //
CREATE PROCEDURE sqlife_1.listJobPage()
BEGIN 
     SELECT * FROM sqlife_1.JobPage;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.listJobPage TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.listMarriage;
DELIMITER //
CREATE PROCEDURE sqlife_1.listMarriage()
BEGIN 
     SELECT * FROM sqlife_1.Marriage;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.listMarriage TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.listMotherFather;
DELIMITER //
CREATE PROCEDURE sqlife_1.listMotherFather()
BEGIN 
     SELECT * FROM sqlife_1.MotherFather;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.listMotherFather TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.listMyNotes;
DELIMITER //
CREATE PROCEDURE sqlife_1.listMyNotes()
BEGIN 
     SELECT * FROM sqlife_1.MyNotes;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.listMyNotes TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.listNaturalMedicines;
DELIMITER //
CREATE PROCEDURE sqlife_1.listNaturalMedicines()
BEGIN 
     SELECT * FROM sqlife_1.NaturalMedicines;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.listNaturalMedicines TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.listOrganization;
DELIMITER //
CREATE PROCEDURE sqlife_1.listOrganization()
BEGIN 
     SELECT * FROM sqlife_1.Organization;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.listOrganization TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.listPerson;
DELIMITER //
CREATE PROCEDURE sqlife_1.listPerson()
BEGIN 
     SELECT * FROM sqlife_1.Person;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.listPerson TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.listReading;
DELIMITER //
CREATE PROCEDURE sqlife_1.listReading()
BEGIN 
     SELECT * FROM sqlife_1.Reading;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.listReading TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.listSecret;
DELIMITER //
CREATE PROCEDURE sqlife_1.listSecret()
BEGIN 
     SELECT * FROM sqlife_1.Secret;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.listSecret TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.listShowWatched;
DELIMITER //
CREATE PROCEDURE sqlife_1.listShowWatched()
BEGIN 
     SELECT * FROM sqlife_1.ShowWatched;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.listShowWatched TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.listSpending;
DELIMITER //
CREATE PROCEDURE sqlife_1.listSpending()
BEGIN 
     SELECT * FROM sqlife_1.Spending;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.listSpending TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.listTableTracker;
DELIMITER //
CREATE PROCEDURE sqlife_1.listTableTracker()
BEGIN 
     SELECT * FROM sqlife_1.TableTracker;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.listTableTracker TO 'user'@'localhost';
