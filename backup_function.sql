USE sqlife_1;
DROP PROCEDURE IF EXISTS sqlife_1.BackupData;

DELIMITER //
CREATE PROCEDURE sqlife_1.BackupData()
BEGIN
DELETE FROM backup_sqlife_1.contact_1; 
DELETE FROM backup_sqlife_1.address_1;
DELETE FROM backup_sqlife_1.spending_1;
DELETE FROM backup_sqlife_1.cooking_1;
DELETE FROM backup_sqlife_1.food_1;
DELETE FROM backup_sqlife_1.show_watched_1;
DELETE FROM backup_sqlife_1.person_1;
DELETE FROM backup_sqlife_1.table_tracker_1;
DELETE FROM backup_sqlife_1.my_notes_1;
DELETE FROM backup_sqlife_1.natural_medicines_1;
DELETE FROM backup_sqlife_1.application_1;
DELETE FROM backup_sqlife_1.job_page_1;
DELETE FROM backup_sqlife_1.company_1;
DELETE FROM backup_sqlife_1.reading_1;
DELETE FROM backup_sqlife_1.book_1;
DELETE FROM backup_sqlife_1.secret_1;
DELETE FROM backup_sqlife_1.organization_1;
DELETE FROM backup_sqlife_1.mother_father_1;
DELETE FROM backup_sqlife_1.marriage_1;
DELETE FROM backup_sqlife_1.follow_up_1;

INSERT INTO backup_sqlife_1.contact_1(SELECT * FROM backup_sqlife_1.contact);
INSERT INTO backup_sqlife_1.address_1(SELECT * FROM backup_sqlife_1.address);
INSERT INTO backup_sqlife_1.spending_1(SELECT * FROM backup_sqlife_1.spending);
INSERT INTO backup_sqlife_1.cooking_1(SELECT * FROM backup_sqlife_1.cooking);
INSERT INTO backup_sqlife_1.food_1(SELECT * FROM backup_sqlife_1.food);
INSERT INTO backup_sqlife_1.show_watched_1(SELECT * FROM backup_sqlife_1.show_watched);
INSERT INTO backup_sqlife_1.person_1(SELECT * FROM backup_sqlife_1.person);
INSERT INTO backup_sqlife_1.table_tracker_1(SELECT * FROM backup_sqlife_1.table_tracker);
INSERT INTO backup_sqlife_1.my_notes_1(SELECT * FROM backup_sqlife_1.my_notes);
INSERT INTO backup_sqlife_1.natural_medicines_1(SELECT * FROM backup_sqlife_1.natural_medicines);
INSERT INTO backup_sqlife_1.application_1(SELECT * FROM backup_sqlife_1.application);
INSERT INTO backup_sqlife_1.job_page_1(SELECT * FROM backup_sqlife_1.job_page);
INSERT INTO backup_sqlife_1.company_1(SELECT * FROM backup_sqlife_1.company);
INSERT INTO backup_sqlife_1.reading_1(SELECT * FROM backup_sqlife_1.reading);
INSERT INTO backup_sqlife_1.book_1(SELECT * FROM backup_sqlife_1.book);
INSERT INTO backup_sqlife_1.secret_1(SELECT * FROM backup_sqlife_1.secret);
INSERT INTO backup_sqlife_1.organization_1(SELECT * FROM backup_sqlife_1.organization);
INSERT INTO backup_sqlife_1.mother_father_1(SELECT * FROM backup_sqlife_1.mother_father);
INSERT INTO backup_sqlife_1.marriage_1(SELECT * FROM backup_sqlife_1.marriage);
INSERT INTO backup_sqlife_1.follow_up_1(SELECT * FROM backup_sqlife_1.follow_up);

DELETE FROM backup_sqlife_1.contact; 
DELETE FROM backup_sqlife_1.address;
DELETE FROM backup_sqlife_1.spending;
DELETE FROM backup_sqlife_1.cooking;
DELETE FROM backup_sqlife_1.food;
DELETE FROM backup_sqlife_1.show_watched;
DELETE FROM backup_sqlife_1.person;
DELETE FROM backup_sqlife_1.table_tracker;
DELETE FROM backup_sqlife_1.my_notes;
DELETE FROM backup_sqlife_1.natural_medicines;
DELETE FROM backup_sqlife_1.application;
DELETE FROM backup_sqlife_1.job_page;
DELETE FROM backup_sqlife_1.company;
DELETE FROM backup_sqlife_1.reading;
DELETE FROM backup_sqlife_1.book;
DELETE FROM backup_sqlife_1.secret;
DELETE FROM backup_sqlife_1.organization;
DELETE FROM backup_sqlife_1.mother_father;
DELETE FROM backup_sqlife_1.marriage;
DELETE FROM backup_sqlife_1.follow_up;

INSERT INTO backup_sqlife_1.contact(SELECT * FROM sqlife_1.contact);
INSERT INTO backup_sqlife_1.address(SELECT * FROM sqlife_1.address);
INSERT INTO backup_sqlife_1.spending(SELECT * FROM sqlife_1.spending);
INSERT INTO backup_sqlife_1.cooking(SELECT * FROM sqlife_1.cooking);
INSERT INTO backup_sqlife_1.food(SELECT * FROM sqlife_1.food);
INSERT INTO backup_sqlife_1.show_watched(SELECT * FROM sqlife_1.show_watched);
INSERT INTO backup_sqlife_1.person(SELECT * FROM sqlife_1.person);
INSERT INTO backup_sqlife_1.table_tracker(SELECT * FROM sqlife_1.table_tracker);
INSERT INTO backup_sqlife_1.my_notes(SELECT * FROM sqlife_1.my_notes);
INSERT INTO backup_sqlife_1.natural_medicines(SELECT * FROM sqlife_1.natural_medicines);
INSERT INTO backup_sqlife_1.application(SELECT * FROM sqlife_1.application);
INSERT INTO backup_sqlife_1.job_page(SELECT * FROM sqlife_1.job_page);
INSERT INTO backup_sqlife_1.company(SELECT * FROM sqlife_1.company);
INSERT INTO backup_sqlife_1.book(SELECT * FROM sqlife_1.book);
INSERT INTO backup_sqlife_1.reading(SELECT * FROM sqlife_1.reading);
INSERT INTO backup_sqlife_1.secret(SELECT * FROM sqlife_1.secret);
INSERT INTO backup_sqlife_1.organization(SELECT * FROM sqlife_1.organization);
INSERT INTO backup_sqlife_1.mother_father(SELECT * FROM sqlife_1.mother_father);
INSERT INTO backup_sqlife_1.marriage(SELECT * FROM sqlife_1.marriage);
INSERT INTO backup_sqlife_1.follow_up(SELECT * FROM sqlife_1.follow_up);

END //
DELIMITER ;


