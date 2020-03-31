#!/bin/bash
SQL_PASSWORD='mypass123' #FIXME use this

# wait for db to initialize before running sql commands
until nc -z -w60 localhost 3306; do sleep 1; done
sleep 1

#run commands against the 'mysql' database
mysql -u root -p$SQL_PASSWORD mysql -e "
ALTER USER root IDENTIFIED WITH mysql_native_password BY 'mypass123';
"

#create database 'gnomedb'
mysql -u root -p$SQL_PASSWORD mysql -e "CREATE DATABASE gnomedb;"

#run commands against the 'gnomedb' database
mysql -u root -p$SQL_PASSWORD gnomedb -e "
CREATE TABLE Holidays (HolidayName varchar(255), HolidayID int);

INSERT INTO gnomedb.Holidays (HolidayName, HolidayID) VALUES
  ('Christmas', '12'), ('Thanksgiving', '10'), ('Mothers Day', '4'), ('Easter', '5'), ('Fourth of July', '7'), ('Fathers Day', '6'), ('Halloween', '8'), ('Valentines Day', '2'),('Saint Patricks Day', '3'), ('New Years', '1'), ('Hanukkah', '11'), ('Kwanzaa', '13'), ('Diwali', '9');

CREATE TABLE SampleCards (image_id INT(10) auto_increment, Image MEDIUMBLOB NOT NULL, Image_Filename VARCHAR(50) NOT NULL, PRIMARY KEY(image_id));

INSERT INTO gnomedb.SampleCards(Image, Image_Filename) VALUES
    (LOAD_FILE('/images/BlankChristmas_1.jpg'), 'BlankChristmas_1.jpg'),
    (LOAD_FILE('/images/BlankChristmas_2.jpg'), 'BlankChristmas_2.jpg');
"

echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--- SQL READY ---
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
