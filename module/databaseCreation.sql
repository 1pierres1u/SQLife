DROP DATABASE IF EXISTS sqlife_1;
CREATE DATABASE IF NOT EXISTS sqlife_1;
USE sqlife_1;

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
DROP DATABASE IF EXISTS backup_sqlife_1;
CREATE DATABASE IF NOT EXISTS backup_sqlife_1;
USE backup_sqlife_1;

CREATE TABLE address LIKE sqlife_1.address;
CREATE TABLE contact LIKE sqlife_1.contact;
CREATE TABLE spending LIKE sqlife_1.spending;
CREATE TABLE cooking LIKE sqlife_1.cooking;
CREATE TABLE food LIKE sqlife_1.food;
CREATE TABLE show_watched LIKE sqlife_1.show_watched;
CREATE TABLE person LIKE sqlife_1.person;
CREATE TABLE table_tracker LIKE sqlife_1.table_tracker;
CREATE TABLE my_notes LIKE sqlife_1.my_notes;
CREATE TABLE natural_medicines LIKE sqlife_1.natural_medicines;
CREATE TABLE company LIKE sqlife_1.company; 
CREATE TABLE job_page LIKE sqlife_1.job_page;
CREATE TABLE application LIKE sqlife_1.application;
CREATE TABLE follow_up LIKE sqlife_1.follow_up;
CREATE TABLE book LIKE sqlife_1.book;
CREATE TABLE reading LIKE sqlife_1.reading;
CREATE TABLE organization LIKE sqlife_1.organization;
CREATE TABLE secret LIKE sqlife_1.secret;
CREATE TABLE mother_father LIKE sqlife_1.mother_father;
CREATE TABLE marriage LIKE sqlife_1.marriage;

##SECOND BACKUP TABLES
CREATE TABLE address_1 LIKE sqlife_1.address;
CREATE TABLE contact_1 LIKE sqlife_1.contact;
CREATE TABLE spending_1 LIKE sqlife_1.spending;
CREATE TABLE cooking_1 LIKE sqlife_1.cooking;
CREATE TABLE food_1 LIKE sqlife_1.food;
CREATE TABLE show_watched_1 LIKE sqlife_1.show_watched;
CREATE TABLE person_1 LIKE sqlife_1.person;
CREATE TABLE table_tracker_1 LIKE sqlife_1.table_tracker;
CREATE TABLE my_notes_1 LIKE sqlife_1.my_notes;
CREATE TABLE natural_medicines_1 LIKE sqlife_1.natural_medicines;
CREATE TABLE company_1 LIKE sqlife_1.company; 
CREATE TABLE job_page_1 LIKE sqlife_1.job_page;
CREATE TABLE application_1 LIKE sqlife_1.application;
CREATE TABLE book_1 LIKE sqlife_1.book;
CREATE TABLE reading_1 LIKE sqlife_1.reading;
CREATE TABLE organization_1 LIKE sqlife_1.organization;
CREATE TABLE secret_1 LIKE sqlife_1.secret;
CREATE TABLE mother_father_1 LIKE sqlife_1.mother_father;
CREATE TABLE marriage_1 LIKE sqlife_1.marriage;
CREATE TABLE follow_up_1 LIKE sqlife_1.follow_up;
