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


##BOOK 
DROP PROCEDURE IF EXISTS sqlife_1.findBookByISBN;
DELIMITER //
CREATE PROCEDURE sqlife_1.findBookByISBN(IN ISBNs VARCHAR(200))
BEGIN 
    SELECT * FROM BOOK where isbn = ISBNs;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.findBookByISBN TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.findBookByTitle;
CREATE PROCEDURE sqlife_1.findBookByTitle(IN Titles VARCHAR(200))
BEGIN 
    SELECT * FROM book WHERE title=titles;
END //
DELIMITER ;
GRANT EXECUTE ON sqlife_1.findBookByTitle TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.findBookByAuthor;
DELIMITER //
CREATE PROCEDURE sqlife_1.findBookByAuthor(IN Authors VARCHAR(200))
BEGIN 
    SELECT * FROM book WHERE author = Authors;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.findBookByAuthor TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.findBookByGenre;
DELIMITER //
CREATE PROCEDURE sqlife_1.findBookByGenre(IN Genres VARCHAR(200))
BEGIN 
      SELECT * FROM book WHERE genre = Genres;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.findBookByGenre TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.findBookReadFrom;
DELIMITER //
CREATE PROCEDURE sqlife_1.findBookReadFrom(IN beg DATE, IN en DATE)
BEGIN
   SELECT b.title,r.page_end-r.page_start AS num_page_read,r.dat FROM book b RIGHT JOIN reading r ON b.id=r.fk_id_book WHERE beg < dat and dat < en;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.findBookReadFrom TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.findPagesRead;
DELIMITER //
CREATE PROCEDURE sqlife_1.findPagesRead(IN Titles VARCHAR(200))
BEGIN      
     SELECT id INTO @i FROM book WHERE title = titles;
     SELECT b.title,r.page_start,r.page_end,r.page_end-r.page_start as pages_read FROM book b RIGHT JOIN reading r on r.fk_id_book = @i WHERE b.id = @i;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.findPagesRead TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.findListGenreBook;
DELIMITER //
CREATE PROCEDURE sqlife_1.findListGenreBook()
BEGIN
    SELECT genre FROM Book ORDER BY genre;     
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.findListGenreBook TO 'user'@'localhost';



## SPENDING 
DROP PROCEDURE IF EXISTS sqlife_1.findSpendingByType;
DELIMITER //
CREATE PROCEDURE sqlife_1.findSpendingByType(IN t VARCHAR(40))
BEGIN 
     SELECT * FROM sqlife_1.spending WHERE typ = t;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.findSpendingByType TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.findSpendingByAmount;
DELIMITER //
CREATE PROCEDURE sqlife_1.findSpendingByAmount(IN amt DECIMAL(10,2))
BEGIN 
     SELECT * FROM sqlife_1.spending WHERE amount = amt;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.findSpendingByAmount TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.findSpendingLessThan;
DELIMITER //
CREATE PROCEDURE sqlife_1.findSpendingLessThan(IN amt DECIMAL(10,2))
BEGIN 
	SELECT * FROM sqlife_1.spending WHERE amount <= amt;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.findSpendingLessThan TO 'user'@'localhost';


DROP PROCEDURE IF EXISTS sqlife_1.findSpendingGreaterThan;
DELIMITER //
CREATE PROCEDURE sqlife_1.findSpendingGreaterThan(IN amt DECIMAL(10,2))
BEGIN 
      SELECT * FROM sqlife_1.spending WHERE amount >= amt;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.findSpendingGreaterThan TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.findSpendingFrom;
DELIMITER //
CREATE PROCEDURE sqlife_1.findSpendingFrom(IN bg DATE, IN ed DATE)
BEGIN 
	SELECT * FROM spending s WHERE  bg < dat AND dat < ed;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.findSpendingFrom TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.findSpendingByPlace;
DELIMITER //
CREATE PROCEDURE sqlife_1.findSpendingByPlace(IN place VARCHAR(100))
BEGIN
	SELECT * FROM sqlife_1.spending WHERE wher = place;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.findSpendingByPlace TO 'user'@'localhost';


## FOOD 
DROP PROCEDURE IF EXISTS sqlife_1.findFoodByName;
DELIMITER //
CREATE PROCEDURE sqlife_1.findFoodByName(IN n VARCHAR(200))
BEGIN 
       SELECT * FROM food WHERE name = n;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.findFoodByName TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.findFoodLessThan;
DELIMITER //
CREATE PROCEDURE sqlife_1.findFoodLessThan(IN p DECIMAL(10,2))
BEGIN
	SELECT * FROM food WHERE price <= p;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.findFoodByName TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.findFoodGreaterThan;
DELIMITER //
CREATE PROCEDURE sqlife_1.findFoodGreaterThan(IN p DECIMAL(10,2))
BEGIN 
	SELECT * FROM sqlife_1.food WHERE price >= p;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.findFoodGreaterThan TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.findFoodByCategory;
DELIMITER //
CREATE PROCEDURE sqlife_1.findFoodByCategory(IN t VARCHAR(200))
BEGIN 
	SELECT * FROM sqlife_1.food WHERE category=t;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.findFoodByCategory TO 'user'@'localhost';


## NOTES 
DROP PROCEDURE IF EXISTS sqlife_1.findNotesByTitle;
DELIMITER //
CREATE PROCEDURE sqlife_1.findNotesByTitle(IN t VARCHAR(200))
BEGIN 
     SELECT * FROM my_notes WHERE title = t;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.findNotesByTitle TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.findNotesByDate;
DELIMITER //
CREATE PROCEDURE sqlife_1.findNotesByDate(IN bg DATE, IN ed DATE)
BEGIN 
	SELECT * FROM my_notes WHERE bg < dat AND dat < ed;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.findNotesByDate TO 'user'@'localhost';


DROP PROCEDURE IF EXISTS sqlife_1.findNotesByDateTitle;
DELIMITER //
CREATE PROCEDURE sqlife_1.findNotesByDateTitle(IN bg DATE, IN ed DATE, IN t VARCHAR(200))
BEGIN
	SELECT * FROM my_notes WHERE bg < dat AND dat < ed AND title=t;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.findNotesByDateTitle TO 'user'@'localhost';


## COMPANY 
DROP PROCEDURE IF EXISTS  sqlife_1.findCompanyByType;
DELIMITER //
CREATE PROCEDURE sqlife_1.findCompanyByType(IN t VARCHAR(200))
BEGIN 
	SELECT * FROM company WHERE typ = t;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.findCompanyByType TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.findCompanyByName;
DELIMITER //
CREATE PROCEDURE sqlife_1.findCompanyByName(IN n VARCHAR(200))
BEGIN 
	SELECT * FROM company WHERE name = n;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.findCompanyByName TO 'user'@'localhost';

# NATURAL MEDICINES
DROP PROCEDURE IF EXISTS sqlife_1.findMedicinesByBenefits;
DELIMITER //
CREATE PROCEDURE sqlife_1.findMedicinesByBenefits(IN b VARCHAR(200))
BEGIN 
       SELECT * FROM natural_medicines WHERE benefits = b;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.findMedicinesByBenefits TO 'user'@'localhost';

## SHOW WATCHED
DROP PROCEDURE IF EXISTS sqlife_1.findShowByTitle;
DELIMITER //
CREATE PROCEDURE sqlife_1.findShowByTitle(IN t VARCHAR(200))
BEGIN 
       SELECT * FROM show_watched WHERE title = t;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.findShowByTitle TO 'user'@'localhost';

DROP PROCEDURE IF EXISTS sqlife_1.findShowByDate;
DELIMITER //
CREATE PROCEDURE sqlife_1.findShowByDate(IN bg DATE, IN ed DATE)
BEGIN
      SELECT * FROM show_watched WHERE bg < dat AND dat < ed;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.findShowByDate TO 'user'@'localhost';


## JOBS
DROP PROCEDURE IF EXISTS  sqlife_1.findCompanyByID;
DELIMITER //
CREATE PROCEDURE sqlife_1.findCompanyByID(IN i INTEGER)
BEGIN 
	SELECT * FROM company WHERE id = i;
END //
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sqlife_1.findCompanyByID TO 'user'@'localhost';

