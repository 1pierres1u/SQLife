##############################################################
####   CREATE TABLES OF THE DATABASE
##############################################################

DROP DATABASE IF EXISTS sqlife_2;
CREATE DATABASE IF NOT EXISTS sqlife_2;
USE sqlife_2;

#########################################################
CREATE TABLE contact(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(100),
  middle_name VARCHAR(100),
  last_name VARCHAR(100),
  relation VARCHAR(40),
  mobile VARCHAR(14),
  home VARCHAR(14),
  work VARCHAR(14)
);

CREATE TABLE address(
   id INTEGER PRIMARY KEY AUTO_INCREMENT,
   fk_id_contact INTEGER NOT NULL,
   country VARCHAR(60),
   state VARCHAR(60),
   city VARCHAR(60),
   apt VARCHAR(10),
   street VARCHAR(40),
   zipcode VARCHAR(10),
   FOREIGN KEY (fk_id_contact) REFERENCES contact(id)
);


#########################################################
CREATE TABLE spending(
     id INTEGER PRIMARY KEY AUTO_INCREMENT,
     dat TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
     wher VARCHAR(30),
     typ VARCHAR(30) NOT NULL,
     amount DECIMAL(10,2) NOT NULL,
     items VARCHAR(200) NOT NULL
);


CREATE TABLE cooking(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	dat TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	typ ENUM('breakfast', 'lunch', 'dinner') NOT NULL,
	prep_duration DECIMAL,
        description VARCHAR(200) NOT NULL
);	


CREATE TABLE food(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(30),
	category VARCHAR(30),
	wher VARCHAR(30),
	price DECIMAL(10,2),
	quantity DECIMAL(10,2),
	description VARCHAR(30)
);

CREATE TABLE show_watched(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	fk_id_user INTEGER NOT NULL,
	title VARCHAR(50) NOT NULL,
	genre VARCHAR(30),
	duration DECIMAL NOT NULL, 
        dat TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	description VARCHAR(200),
	FOREIGN KEY(fk_id_user) REFERENCES users(id)
);
############################################################
CREATE TABLE person(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(100) NOT NULL,
  middle_name VARCHAR(100),
  last_name VARCHAR(100) NOT NULL,
  sex ENUM('female','male'),
  dob DATE,
  died DATE,
  country_birth VARCHAR(60),
  country_death VARCHAR(60),
  place_birth VARCHAR(200),
  place_death VARCHAR(200),
  elementary_school VARCHAR(200),
  high_school VARCHAR(200),
  college VARCHAR(200),
  profession VARCHAR(200)
);



CREATE TABLE mother_father(
       id INTEGER PRIMARY KEY AUTO_INCREMENT,
       fk_id_child  INTEGER NOT NULL,
       fk_id_parent INTEGER NOT NULL,
       FOREIGN KEY(fk_id_child) REFERENCES person(id),
       FOREIGN KEY(fk_id_parent) REFERENCES person(id)
);

CREATE TABLE marriage(
       id INTEGER PRIMARY KEY AUTO_INCREMENT,
       fk_id_person1 INTEGER NOT NULL,
       fk_id_person2 INTEGER NOT NULL,
       marriage_date DATE,
       marriage_description VARCHAR(300),
       divorce_date DATE,
       divorce_description VARCHAR(300),
       FOREIGN KEY (fk_id_person1) REFERENCES person(id),
       FOREIGN KEY (fk_id_person2) REFERENCES person(id)
);


############################################################
CREATE TABLE organization(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	typ ENUM('website','laptop','smartphone','app') NOT NULL,
	website VARCHAR(100), 
	email VARCHAR(100),
	description VARCHAR(200)
);


CREATE TABLE secret(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  fk_organization_id INTEGER NOT NULL,
  secret_1 VARCHAR(100),
  secret_2 VARCHAR(100),
  description VARCHAR(100),
  FOREIGN KEY(fk_organization_id) REFERENCES organization(id)
);

############################################################
CREATE TABLE book(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(40) NOT NULL,
	author VARCHAR(100) NOT NULL,
	genre VARCHAR(40),
	isbn VARCHAR(17) NOT NULL,
	year_published INTEGER,
        publisher VARCHAR(100),
	n_pages INTEGER NOT NULL,
	done ENUM('TRUE','FALSE') DEFAULT 'FALSE'
);


CREATE TABLE reading(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	dat TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        page_start INTEGER NOT NULL,
	page_end INTEGER NOT NULL,
	fk_id_book INTEGER NOT NULL,
	FOREIGN KEY(fk_id_book) REFERENCES book(id)
);


##############################################################
CREATE TABLE company(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(100) NOT NULL,
        typ  VARCHAR(100) NOT NULL 
);

CREATE TABLE job_page(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    fk_company_id INTEGER NOT NULL,
    url VARCHAR(300),
    job_title VARCHAR(100),
    FOREIGN KEY(fk_company_id) REFERENCES company(id)
);


CREATE TABLE application(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	fk_job_page_id INTEGER NOT NULL,
	job_title VARCHAR(40),
        dat TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	salary_range VARCHAR(30),
        description VARCHAR(300),
        FOREIGN KEY (fk_job_page_id) REFERENCES job_page(id)	
);

CREATE TABLE follow_up(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	fk_application_id INTEGER NOT NULL ,
	email VARCHAR(300),
	dat TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	phone_interview TIMESTAMP,
	in_person_interview TIMESTAMP,
	code_test TIMESTAMP,
	hired ENUM('TRUE', 'FALSE'), 
	hiring_date TIMESTAMP,
	salary VARCHAR(8),
	FOREIGN KEY(fk_application_id) REFERENCES application(id)
);
##############################################################
CREATE TABLE natural_medicines(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	food VARCHAR(100) NOT NULL,
	benefits VARCHAR(100) NOT NULL,
	recipe VARCHAR(300)
);


##############################################################
CREATE TABLE my_notes(
      id INTEGER PRIMARY KEY AUTO_INCREMENT,
      dat TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      title VARCHAR(200),
      content VARCHAR(500) NOT NULL
);

##############################################################
## TRACKS OPERATIONS
CREATE TABLE table_tracker(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
        dat TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	tabl VARCHAR(40) NOT NULL,
	operation ENUM('update','delete','insert') NOT NULL
);

########BACKUP 
DROP DATABASE IF EXISTS backup_sqlife_2;
CREATE DATABASE IF NOT EXISTS backup_sqlife_2;
USE backup_sqlife_2;

CREATE TABLE address LIKE sqlife_2.address;
CREATE TABLE contact LIKE sqlife_2.contact;
CREATE TABLE spending LIKE sqlife_2.spending;
CREATE TABLE cooking LIKE sqlife_2.cooking;
CREATE TABLE food LIKE sqlife_2.food;
CREATE TABLE show_watched LIKE sqlife_2.show_watched;
CREATE TABLE person LIKE sqlife_2.person;
CREATE TABLE table_tracker LIKE sqlife_2.table_tracker;
CREATE TABLE my_notes LIKE sqlife_2.my_notes;
CREATE TABLE natural_medicines LIKE sqlife_2.natural_medicines;
CREATE TABLE company LIKE sqlife_2.company; 
CREATE TABLE job_page LIKE sqlife_2.job_page;
CREATE TABLE application LIKE sqlife_2.application;
CREATE TABLE follow_up LIKE sqlife_2.follow_up;
CREATE TABLE book LIKE sqlife_2.book;
CREATE TABLE reading LIKE sqlife_2.reading;
CREATE TABLE organization LIKE sqlife_2.organization;
CREATE TABLE secret LIKE sqlife_2.secret;
CREATE TABLE mother_father LIKE sqlife_2.mother_father;
CREATE TABLE marriage LIKE sqlife_2.marriage;

##SECOND BACKUP TABLES
CREATE TABLE address_1 LIKE sqlife_2.address;
CREATE TABLE contact_1 LIKE sqlife_2.contact;
CREATE TABLE spending_1 LIKE sqlife_2.spending;
CREATE TABLE cooking_1 LIKE sqlife_2.cooking;
CREATE TABLE food_1 LIKE sqlife_2.food;
CREATE TABLE show_watched_1 LIKE sqlife_2.show_watched;
CREATE TABLE person_1 LIKE sqlife_2.person;
CREATE TABLE table_tracker_1 LIKE sqlife_2.table_tracker;
CREATE TABLE my_notes_1 LIKE sqlife_2.my_notes;
CREATE TABLE natural_medicines_1 LIKE sqlife_2.natural_medicines;
CREATE TABLE company_1 LIKE sqlife_2.company; 
CREATE TABLE job_page_1 LIKE sqlife_2.job_page;
CREATE TABLE application_1 LIKE sqlife_2.application;
CREATE TABLE book_1 LIKE sqlife_2.book;
CREATE TABLE reading_1 LIKE sqlife_2.reading;
CREATE TABLE organization_1 LIKE sqlife_2.organization;
CREATE TABLE secret_1 LIKE sqlife_2.secret;
CREATE TABLE mother_father_1 LIKE sqlife_2.mother_father;
CREATE TABLE marriage_1 LIKE sqlife_2.marriage;
CREATE TABLE follow_up_1 LIKE sqlife_2.follow_up;




##############################################################
####   BACKUP FUNCTIONS
##############################################################

USE sqlife_2;
DROP PROCEDURE IF EXISTS sqlife_2.BackupData;

DELIMITER //
CREATE PROCEDURE sqlife_2.BackupData()
BEGIN
DELETE FROM backup_sqlife_2.contact_1; 
DELETE FROM backup_sqlife_2.address_1;
DELETE FROM backup_sqlife_2.spending_1;
DELETE FROM backup_sqlife_2.cooking_1;
DELETE FROM backup_sqlife_2.food_1;
DELETE FROM backup_sqlife_2.show_watched_1;
DELETE FROM backup_sqlife_2.person_1;
DELETE FROM backup_sqlife_2.table_tracker_1;
DELETE FROM backup_sqlife_2.my_notes_1;
DELETE FROM backup_sqlife_2.natural_medicines_1;
DELETE FROM backup_sqlife_2.application_1;
DELETE FROM backup_sqlife_2.job_page_1;
DELETE FROM backup_sqlife_2.company_1;
DELETE FROM backup_sqlife_2.reading_1;
DELETE FROM backup_sqlife_2.book_1;
DELETE FROM backup_sqlife_2.secret_1;
DELETE FROM backup_sqlife_2.organization_1;
DELETE FROM backup_sqlife_2.mother_father_1;
DELETE FROM backup_sqlife_2.marriage_1;
DELETE FROM backup_sqlife_2.follow_up_1;

INSERT INTO backup_sqlife_2.contact_1(SELECT * FROM backup_sqlife_2.contact);
INSERT INTO backup_sqlife_2.address_1(SELECT * FROM backup_sqlife_2.address);
INSERT INTO backup_sqlife_2.spending_1(SELECT * FROM backup_sqlife_2.spending);
INSERT INTO backup_sqlife_2.cooking_1(SELECT * FROM backup_sqlife_2.cooking);
INSERT INTO backup_sqlife_2.food_1(SELECT * FROM backup_sqlife_2.food);
INSERT INTO backup_sqlife_2.show_watched_1(SELECT * FROM backup_sqlife_2.show_watched);
INSERT INTO backup_sqlife_2.person_1(SELECT * FROM backup_sqlife_2.person);
INSERT INTO backup_sqlife_2.table_tracker_1(SELECT * FROM backup_sqlife_2.table_tracker);
INSERT INTO backup_sqlife_2.my_notes_1(SELECT * FROM backup_sqlife_2.my_notes);
INSERT INTO backup_sqlife_2.natural_medicines_1(SELECT * FROM backup_sqlife_2.natural_medicines);
INSERT INTO backup_sqlife_2.application_1(SELECT * FROM backup_sqlife_2.application);
INSERT INTO backup_sqlife_2.job_page_1(SELECT * FROM backup_sqlife_2.job_page);
INSERT INTO backup_sqlife_2.company_1(SELECT * FROM backup_sqlife_2.company);
INSERT INTO backup_sqlife_2.reading_1(SELECT * FROM backup_sqlife_2.reading);
INSERT INTO backup_sqlife_2.book_1(SELECT * FROM backup_sqlife_2.book);
INSERT INTO backup_sqlife_2.secret_1(SELECT * FROM backup_sqlife_2.secret);
INSERT INTO backup_sqlife_2.organization_1(SELECT * FROM backup_sqlife_2.organization);
INSERT INTO backup_sqlife_2.mother_father_1(SELECT * FROM backup_sqlife_2.mother_father);
INSERT INTO backup_sqlife_2.marriage_1(SELECT * FROM backup_sqlife_2.marriage);
INSERT INTO backup_sqlife_2.follow_up_1(SELECT * FROM backup_sqlife_2.follow_up);

DELETE FROM backup_sqlife_2.contact; 
DELETE FROM backup_sqlife_2.address;
DELETE FROM backup_sqlife_2.spending;
DELETE FROM backup_sqlife_2.cooking;
DELETE FROM backup_sqlife_2.food;
DELETE FROM backup_sqlife_2.show_watched;
DELETE FROM backup_sqlife_2.person;
DELETE FROM backup_sqlife_2.table_tracker;
DELETE FROM backup_sqlife_2.my_notes;
DELETE FROM backup_sqlife_2.natural_medicines;
DELETE FROM backup_sqlife_2.application;
DELETE FROM backup_sqlife_2.job_page;
DELETE FROM backup_sqlife_2.company;
DELETE FROM backup_sqlife_2.reading;
DELETE FROM backup_sqlife_2.book;
DELETE FROM backup_sqlife_2.secret;
DELETE FROM backup_sqlife_2.organization;
DELETE FROM backup_sqlife_2.mother_father;
DELETE FROM backup_sqlife_2.marriage;
DELETE FROM backup_sqlife_2.follow_up;

INSERT INTO backup_sqlife_2.contact(SELECT * FROM sqlife_2.contact);
INSERT INTO backup_sqlife_2.address(SELECT * FROM sqlife_2.address);
INSERT INTO backup_sqlife_2.spending(SELECT * FROM sqlife_2.spending);
INSERT INTO backup_sqlife_2.cooking(SELECT * FROM sqlife_2.cooking);
INSERT INTO backup_sqlife_2.food(SELECT * FROM sqlife_2.food);
INSERT INTO backup_sqlife_2.show_watched(SELECT * FROM sqlife_2.show_watched);
INSERT INTO backup_sqlife_2.person(SELECT * FROM sqlife_2.person);
INSERT INTO backup_sqlife_2.table_tracker(SELECT * FROM sqlife_2.table_tracker);
INSERT INTO backup_sqlife_2.my_notes(SELECT * FROM sqlife_2.my_notes);
INSERT INTO backup_sqlife_2.natural_medicines(SELECT * FROM sqlife_2.natural_medicines);
INSERT INTO backup_sqlife_2.application(SELECT * FROM sqlife_2.application);
INSERT INTO backup_sqlife_2.job_page(SELECT * FROM sqlife_2.job_page);
INSERT INTO backup_sqlife_2.company(SELECT * FROM sqlife_2.company);
INSERT INTO backup_sqlife_2.book(SELECT * FROM sqlife_2.book);
INSERT INTO backup_sqlife_2.reading(SELECT * FROM sqlife_2.reading);
INSERT INTO backup_sqlife_2.secret(SELECT * FROM sqlife_2.secret);
INSERT INTO backup_sqlife_2.organization(SELECT * FROM sqlife_2.organization);
INSERT INTO backup_sqlife_2.mother_father(SELECT * FROM sqlife_2.mother_father);
INSERT INTO backup_sqlife_2.marriage(SELECT * FROM sqlife_2.marriage);
INSERT INTO backup_sqlife_2.follow_up(SELECT * FROM sqlife_2.follow_up);
END //
DELIMITER ;



##############################################################
####   TRIGGERS WATCHING TABLES
##############################################################

USE sqlife_2;

## my_notes
DROP TRIGGER IF EXISTS ins_my_notes;
DELIMITER  //
CREATE TRIGGER ins_my_notes
BEFORE INSERT ON my_notes
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("my_notes","insert");
END //
DROP TRIGGER IF EXISTS upd_my_notes //
DELIMITER  //
CREATE TRIGGER upd_my_notes
BEFORE UPDATE ON my_notes
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("my_notes","update");
END //
DROP TRIGGER IF EXISTS del_my_notes //
DELIMITER  //
CREATE TRIGGER del_my_notes
BEFORE DELETE ON my_notes
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("my_notes","delete");
END //


##address 
DROP TRIGGER IF EXISTS ins_address //
DELIMITER  //
CREATE TRIGGER ins_address
BEFORE INSERT ON address
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("address","insert");
END //
DROP TRIGGER IF EXISTS upd_address //
DELIMITER  //
CREATE TRIGGER upd_address
BEFORE UPDATE ON address
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("address","update");
END //
DROP TRIGGER IF EXISTS del_address //
DELIMITER  //
CREATE TRIGGER del_address
BEFORE DELETE ON address
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("address","delete");
END //

##application
DROP TRIGGER IF EXISTS ins_application //
DELIMITER  //
CREATE TRIGGER ins_application
BEFORE INSERT ON application
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("application","insert");
END //
DROP TRIGGER IF EXISTS upd_application //
DELIMITER  //
CREATE TRIGGER upd_application
BEFORE UPDATE ON application
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("application","update");
END //
DROP TRIGGER IF EXISTS del_application //
DELIMITER  //
CREATE TRIGGER del_application
BEFORE DELETE ON application
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("application","delete");
END //

##book
DROP TRIGGER IF EXISTS ins_book //
DELIMITER  //
CREATE TRIGGER ins_book
BEFORE INSERT ON book
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("book","insert");
END //
DROP TRIGGER IF EXISTS upd_book //
DELIMITER  //
CREATE TRIGGER upd_book
BEFORE UPDATE ON book
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("book","update");
END //
DROP TRIGGER IF EXISTS del_book //
DELIMITER  //
CREATE TRIGGER del_book
BEFORE DELETE ON book
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("book","delete");
END //

##company
DROP TRIGGER IF EXISTS ins_company //
DELIMITER  //
CREATE TRIGGER ins_company
BEFORE INSERT ON company
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("company","insert");
END //
DROP TRIGGER IF EXISTS upd_company //
DELIMITER  //
CREATE TRIGGER upd_company
BEFORE UPDATE ON company
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("company","update");
END //
DROP TRIGGER IF EXISTS del_company //
DELIMITER  //
CREATE TRIGGER del_company
BEFORE DELETE ON company
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("company","delete");
END //

##contact
DROP TRIGGER IF EXISTS ins_contact //
DELIMITER  //
CREATE TRIGGER ins_contact
BEFORE INSERT ON contact
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("contact","insert");
END //
DROP TRIGGER IF EXISTS upd_contact //
DELIMITER  //
CREATE TRIGGER upd_contact
BEFORE UPDATE ON contact
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("contact","update");
END //
DROP TRIGGER IF EXISTS del_contact //
DELIMITER  //
CREATE TRIGGER del_contact
BEFORE DELETE ON contact
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("contact","delete");
END //

##cooking 
DROP TRIGGER IF EXISTS ins_cooking //
DELIMITER  //
CREATE TRIGGER ins_cooking
BEFORE INSERT ON cooking
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("cooking","insert");
END //
DROP TRIGGER IF EXISTS upd_cooking //
DELIMITER  //
CREATE TRIGGER upd_cooking
BEFORE UPDATE ON cooking
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("cooking","update");
END //
DROP TRIGGER IF EXISTS del_cooking //
DELIMITER  //
CREATE TRIGGER del_cooking
BEFORE DELETE ON cooking
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("cooking","delete");
END //

##follow_up
DROP TRIGGER IF EXISTS ins_follow_up //
DELIMITER  //
CREATE TRIGGER ins_follow_up
BEFORE INSERT ON follow_up
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("follow_up","insert");
END //
DROP TRIGGER IF EXISTS upd_follow_up //
DELIMITER  //
CREATE TRIGGER upd_follow_up
BEFORE UPDATE ON follow_up
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("follow_up","update");
END //
DROP TRIGGER IF EXISTS del_follow_up //
DELIMITER  //
CREATE TRIGGER del_follow_up
BEFORE DELETE ON follow_up
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("follow_up","delete");
END //

##food
DROP TRIGGER IF EXISTS ins_food //
DELIMITER  //
CREATE TRIGGER ins_food
BEFORE INSERT ON food
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("food","insert");
END //
DROP TRIGGER IF EXISTS upd_food //
DELIMITER  //
CREATE TRIGGER upd_food
BEFORE UPDATE ON food
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("food","update");
END //
DROP TRIGGER IF EXISTS del_food //
DELIMITER  //
CREATE TRIGGER del_food
BEFORE DELETE ON food
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("food","delete");
END //

##job_page
DROP TRIGGER IF EXISTS ins_job_page //
DELIMITER  //
CREATE TRIGGER ins_job_page
BEFORE INSERT ON job_page
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("job_page","insert");
END //
DROP TRIGGER IF EXISTS upd_job_page //
DELIMITER  //
CREATE TRIGGER upd_job_page
BEFORE UPDATE ON job_page
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("job_page","update");
END //
DROP TRIGGER IF EXISTS del_job_page //
DELIMITER  //
CREATE TRIGGER del_job_page
BEFORE DELETE ON job_page
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("job_page","delete");
END //

##marriage
DROP TRIGGER IF EXISTS ins_marriage //
DELIMITER  //
CREATE TRIGGER ins_marriage
BEFORE INSERT ON marriage
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("marriage","insert");
END //
DROP TRIGGER IF EXISTS upd_marriage //
DELIMITER  //
CREATE TRIGGER upd_marriage
BEFORE UPDATE ON marriage
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("marriage","update");
END //
DROP TRIGGER IF EXISTS del_marriage //
DELIMITER  //
CREATE TRIGGER del_marriage
BEFORE DELETE ON marriage
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("marriage","delete");
END //

##mother_father
DROP TRIGGER IF EXISTS ins_mother_father //
DELIMITER  //
CREATE TRIGGER ins_mother_father
BEFORE INSERT ON mother_father
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("mother_father","insert");
END //
DROP TRIGGER IF EXISTS upd_mother_father //
DELIMITER  //
CREATE TRIGGER upd_mother_father
BEFORE UPDATE ON mother_father
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("mother_father","update");
END //
DROP TRIGGER IF EXISTS del_mother_father //
DELIMITER  //
CREATE TRIGGER del_mother_father
BEFORE DELETE ON mother_father
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("mother_father","delete");
END //

##natural medicines
DROP TRIGGER IF EXISTS ins_natural_medicines //
DELIMITER  //
CREATE TRIGGER ins_natural_medicines
BEFORE INSERT ON natural_medicines
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("natural_medicines","insert");
END //
DROP TRIGGER IF EXISTS upd_natural_medicines //
DELIMITER  //
CREATE TRIGGER upd_natural_medicines
BEFORE UPDATE ON natural_medicines
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("natural_medicines","update");
END //
DROP TRIGGER IF EXISTS del_natural_medicines //
DELIMITER  //
CREATE TRIGGER del_natural_medicines
BEFORE DELETE ON natural_medicines
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("natural_medicines","delete");
END //

##organization
DROP TRIGGER IF EXISTS ins_organization //
DELIMITER  //
CREATE TRIGGER ins_organization
BEFORE INSERT ON organization
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("organization","insert");
END //
DROP TRIGGER IF EXISTS upd_organization //
DELIMITER  //
CREATE TRIGGER upd_organization
BEFORE UPDATE ON organization
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("organization","update");
END //
DROP TRIGGER IF EXISTS del_organization //
DELIMITER  //
CREATE TRIGGER del_organization
BEFORE DELETE ON organization
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("organization","delete");
END //

##person
DROP TRIGGER IF EXISTS ins_person //
DELIMITER  //
CREATE TRIGGER ins_person
BEFORE INSERT ON person
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("person","insert");
END //
DROP TRIGGER IF EXISTS upd_person //
DELIMITER  //
CREATE TRIGGER upd_person
BEFORE UPDATE ON person
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("person","update");
END //
DROP TRIGGER IF EXISTS del_person //
DELIMITER  //
CREATE TRIGGER del_person
BEFORE DELETE ON person
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("person","delete");
END //

##reading 
DROP TRIGGER IF EXISTS ins_reading //
DELIMITER  //
CREATE TRIGGER ins_reading
BEFORE INSERT ON reading
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("reading","insert");
END //
DROP TRIGGER IF EXISTS upd_reading //
DELIMITER  //
CREATE TRIGGER upd_reading
BEFORE UPDATE ON reading
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("reading","update");
END //
DROP TRIGGER IF EXISTS del_reading //
DELIMITER  //
CREATE TRIGGER del_reading
BEFORE DELETE ON reading
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("reading","delete");
END //

##secret
DROP TRIGGER IF EXISTS ins_secret //
DELIMITER  //
CREATE TRIGGER ins_secret
BEFORE INSERT ON secret
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("secret","insert");
END //
DROP TRIGGER IF EXISTS upd_secret //
DELIMITER  //
CREATE TRIGGER upd_secret
BEFORE UPDATE ON secret
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("secret","update");
END //
DROP TRIGGER IF EXISTS del_secret //
DELIMITER  //
CREATE TRIGGER del_secret
BEFORE DELETE ON secret
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("secret","delete");
END //

##show_watched
DROP TRIGGER IF EXISTS ins_show_watched //
DELIMITER  //
CREATE TRIGGER ins_show_watched
BEFORE INSERT ON show_watched
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("show_watched","insert");
END //
DROP TRIGGER IF EXISTS upd_show_watched //
DELIMITER  //
CREATE TRIGGER upd_show_watched
BEFORE UPDATE ON show_watched
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("show_watched","update");
END //
DROP TRIGGER IF EXISTS del_show_watched //
DELIMITER  //
CREATE TRIGGER del_show_watched
BEFORE DELETE ON show_watched
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("show_watched","delete");
END //

##spending
DROP TRIGGER IF EXISTS ins_spending //
DELIMITER  //
CREATE TRIGGER ins_spending
BEFORE INSERT ON spending
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("spending","insert");
END //
DROP TRIGGER IF EXISTS upd_spending //
DELIMITER  //
CREATE TRIGGER upd_spending
BEFORE UPDATE ON spending
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("spending","update");
END //
DROP TRIGGER IF EXISTS del_spending //
DELIMITER  //
CREATE TRIGGER del_spending
BEFORE DELETE ON spending
FOR EACH ROW
BEGIN 
 INSERT INTO table_tracker(tabl,operation) values("spending","delete");
END //

DELIMITER ;


##############################################################
####  WEEkLY EXECUTION OF BACKUP EVENTS 
##############################################################
USE sqlife_2;
SET GLOBAL event_scheduler = ON;

DROP PROCEDURE IF EXISTS sqlife_2.backupController;
DELIMITER //
CREATE PROCEDURE sqlife_2.backupController()
BEGIN 
  DECLARE c INTEGER  DEFAULT 0;
  SELECT COUNT(*) INTO c FROM sqlife_2.table_tracker where tabl <> 'backup';
  IF C > 10 THEN
     CALL sqlife_2.BackupData();
     DELETE FROM sqlife_2.table_tracker where tabl <> 'backup';
     INSERT INTO sqlife_2.table_tracker(tabl,operation) values('backup','insert');
  END IF;
END //
DELIMITER ;


DROP EVENT IF EXISTS sqlife_2.backupEvent;
CREATE EVENT sqlife_2.backupEvent 
ON SCHEDULE EVERY 1 WEEK 
DO 
  CALL sqlife_2.backupController();


####################################################
## CREATE USERS
####################################################
DROP USER IF EXISTS 'user'@'localhost';
CREATE USER IF NOT EXISTS 'user'@'localhost' IDENTIFIED BY '123456789';

GRANT SELECT, INSERT, DELETE ON sqlife_1.* TO 'user'@'localhost';
GRANT SELECT ON backup_sqlife_1.* TO 'user'@'localhost';

GRANT EXECUTE ON PROCEDURE backupData TO 'user'@'localhost';










