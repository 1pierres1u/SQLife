USE sqlife_1;

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



