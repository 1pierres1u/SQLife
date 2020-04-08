## _SQLife_
## :closed_book: :black_nib: :calendar: :telephone_receiver:
MySQL Database dedicated to storing information related to the daily 
activities. The main goal is to provide a centralized acccess to all 
the information related to <br/>
* Spending
* Daily Diet
* Contacts
* Job tracking 
* Note 
* Ancestry Tree
* Reading habits 
* Movies and Shows watched
* Password & Accounts
* Natural Medicines, ancestral leaves

Besides, it offers the possibility to run advanced queries against the 
contact list, the notes and spending history. Its console oriented GUI
will provide functions for non developpers in order to interact with 
the database, it will also be possible to run mysql queries. In fact, 
the database was built mainly to be accessed through mysql queries. 

## _Contents_
* DATABASES <br/>
There are two databases, one backup database and the database sqlife_2.
```mysql
  DROP DATABASE IF EXISTS sqlife_2;
  CREATE DATABASE IF NOT EXISTS sqlife_2;

  DROP DATABASE IF EXISTS backup_sqlife_2;
  CREATE DATABASE IF NOT EXISTS backup_sqlife_2;
```

* TRIGGERS <br/>
When a record is inserted, deleted or updated, triggers are activated and 
the corresponding activity is saved in the table 'table_tracker'.
```mysql
  DROP TRIGGER IF EXISTS ins_show_watched //
  DELIMITER  //
  CREATE TRIGGER ins_show_watched
  BEFORE INSERT ON show_watched
  FOR EACH ROW
  BEGIN 
   INSERT INTO table_tracker(tabl,operation) values("show_watched","insert");
  END //
```


* EVENTS <br/>
Weekly event check for new records and backup the database.
```mysql

  DROP EVENT IF EXISTS sqlife_2.backupEvent;
  CREATE EVENT sqlife_2.backupEvent 
  ON SCHEDULE EVERY 1 WEEK 
  DO 
    CALL sqlife_2.backupController();
```
 
* PROCEDURES <br/>
Searching procedures and others are built to facilitate retrieving of records.
```mysql
  DROP PROCEDURE IF EXISTS sqlife_1.findAddressByName;
  DELIMITER //
  CREATE PROCEDURE sqlife_1.findAddressByName(IN FName VARCHAR(200), IN LName VARCHAR(200))
  BEGIN 
   SELECT a.*,c.first_name,c.last_name FROM address a RIGHT JOIN contact c ON a.fk_id_contact = c.id where c.first_name = FName and c.last_name=LName; 
  END //
  DELIMITER ;
  GRANT EXECUTE ON PROCEDURE sqlife_1.findAddressByName TO 'user'@'localhost'; 
```


## Usage
Once the database is installed, you have the choice to use raw sql or predefined 
procedures. By example, finding what books were read between two dates, can be done like this 
```mysql
   CALL findBookReadFrom('2020-01-01',2020-03-01'); 
```
or, with raw sql queries like this 
```mysql
   SELECT b.title,r.page_end-r.page_start AS num_page_read,r.dat FROM book b RIGHT JOIN reading r ON b.id=r.fk_id_book WHERE '2020-01-01' < dat and dat < '2020-03-01'; 
```



 
## Installation 
To create the database execute the file 'setup.sql' while being in root mode. 
Upon installation of the database, a user with the following credentials is created:
 username: user <br/>
 password: 123456789 <br/>



## License
[![License: GPL v2](https://img.shields.io/badge/License-GPL%20v2-blue.svg)](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html)





