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
 
* FUNCTIONS <br/>



## Usage

 
## Installation 
To create the database execute the file setup.sql. Right after a 
user with the following credentials is created<br/>
 username: user <br/>
 password: 123456789 <br/>


## License

