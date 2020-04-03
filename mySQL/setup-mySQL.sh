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
    (LOAD_FILE('/images/BlankNewYears_1'), 'BlankNewYears_1.jpg'),
    (LOAD_FILE('/images/BlankNewYears_2'), 'BlankNewYears_2.jpg'),
    (LOAD_FILE('/images/BlankNewYears_3'), 'BlankNewYears_3.jpg'),
    (LOAD_FILE('/images/BlankNewYears_4'), 'BlankNewYears_4.jpg'),
    (LOAD_FILE('/images/BlankNewYears_5'), 'BlankNewYears_5.jpg'),
    (LOAD_FILE('/images/BlankValentines_1'), 'BlankValentines_1.jpg'),
    (LOAD_FILE('/images/BlankValentines_2'), 'BlankValentines_2.jpg'),
    (LOAD_FILE('/images/BlankValentines_3'), 'BlankValentines_3.jpg'),
    (LOAD_FILE('/images/BlankValentines_4'), 'BlankValentines_4.jpg'),
    (LOAD_FILE('/images/BlankValentines_5'), 'BlankValentines_5.png'),
    (LOAD_FILE('/images/BlankSaintPats_1'), 'BlankSaintPats_1.jpg'),
    (LOAD_FILE('/images/BlankSaintPats_2'), 'BlankSaintPats_2.jpg'),
    (LOAD_FILE('/images/BlankSaintPats_3'), 'BlankSaintPats_3.jpg'),
    (LOAD_FILE('/images/BlankSaintPats_4'), 'BlankSaintPats_4.jpg'),
    (LOAD_FILE('/images/BlankSaintPats_5'), 'BlankSaintPats_5.jpg'),
    (LOAD_FILE('/images/BlankMothersDay_1.jpg'), 'BlankMothersDay_1.png'),
    (LOAD_FILE('/images/BlankMothersDay_2.jpg'), 'BlankMothersDay_2.png'),
    (LOAD_FILE('/images/BlankMothersDay_3.jpg'), 'BlankMothersDay_3.png'),
    (LOAD_FILE('/images/BlankMothersDay_4.jpg'), 'BlankMothersDay_4.png'),
    (LOAD_FILE('/images/BlankMothersDay_5.jpg'), 'BlankMothersDay_5.png'),
    (LOAD_FILE('/images/BlankEaster_1.jpg'), 'BlankEaster_1.jpg'),
    (LOAD_FILE('/images/BlankEaster_2.jpg'), 'BlankEaster_2.jpg'),
    (LOAD_FILE('/images/BlankEaster_3.jpg'), 'BlankEaster_3.jpg'),
    (LOAD_FILE('/images/BlankEaster_4.jpg'), 'BlankEaster_4.png'),
    (LOAD_FILE('/images/BlankEaster_5.jpg'), 'BlankEaster_5.png'),
    (LOAD_FILE('/images/BlankFathersDay_1.jpg'), 'BlankFathersDay_1.jpg'),
    (LOAD_FILE('/images/BlankFathersDay_2.jpg'), 'BlankFathersDay_2.jpg'),
    (LOAD_FILE('/images/BlankFathersDay_3.jpg'), 'BlankFathersDay_3.jpg'),
    (LOAD_FILE('/images/BlankFathersDay_4.jpg'), 'BlankFathersDay_4.jpg'),
    (LOAD_FILE('/images/BlankFathersDay_5.jpg'), 'BlankFathersDay_5.jpg'),
    (LOAD_FILE('/images/BlankFourthofJuly_1.jpg'), 'BlankFourthofJuly_1.jpg'),
    (LOAD_FILE('/images/BlankFourthofJuly_2.jpg'), 'BlankFourthofJuly_2.jpg'),
    (LOAD_FILE('/images/BlankFourthofJuly_3.png'), 'BlankFourthofJuly_3.png'),
    (LOAD_FILE('/images/BlankFourthofJuly_4.png'), 'BlankFourthofJuly_4.png'),
    (LOAD_FILE('/images/BlankFourthofJuly_5.png'), 'BlankFourthofJuly_5.png'),
    (LOAD_FILE('/images/BlankHalloween_1.png'), 'BlankHalloween_1.png'),
    (LOAD_FILE('/images/BlankHalloween_2.png'), 'BlankHalloween_2.png'),
    (LOAD_FILE('/images/BlankHalloween_3.png'), 'BlankHalloween_3.png'),
    (LOAD_FILE('/images/BlankHalloween_4.png'), 'BlankHalloween_4.png'),
    (LOAD_FILE('/images/BlankHalloween_5.png'), 'BlankHalloween_5.png'),
    (LOAD_FILE('/images/BlankHalloween_6.png'), 'BlankHalloween_6.png'),
    (LOAD_FILE('/images/BlankDiwali_1.jpg'), 'BlankDiwali_1.jpg'),
    (LOAD_FILE('/images/BlankDiwali_2.jpg'), 'BlankDiwali_2.jpg'),
    (LOAD_FILE('/images/BlankDiwali_3.jpg'), 'BlankDiwali_3.jpg'),
    (LOAD_FILE('/images/BlankDiwali_4.jpg'), 'BlankDiwali_4.jpg'),
    (LOAD_FILE('/images/BlankDiwali_5.jpg'), 'BlankDiwali_5.jpg'),
    (LOAD_FILE('/images/BlankThanksgiving_1.jpg'), 'BlankThanksgiving_1.jpg'),
    (LOAD_FILE('/images/BlankThanksgiving_2.jpg'), 'BlankThanksgiving_2.jpg'),
    (LOAD_FILE('/images/BlankThanksgiving_3.jpg'), 'BlankThanksgiving_3.jpg'),
    (LOAD_FILE('/images/BlankThanksgiving_4.jpg'), 'BlankThanksgiving_4.jpg'),
    (LOAD_FILE('/images/BlankThanksgiving_5.jpg'), 'BlankThanksgiving_5.jpg'),
    (LOAD_FILE('/images/BlankHanukkah_1.jpg'), 'BlankHanukkah_1.jpg'),
    (LOAD_FILE('/images/BlankHanukkah_2.jpg'), 'BlankHanukkah_2.jpg'),
    (LOAD_FILE('/images/BlankHanukkah_3.jpg'), 'BlankHanukkah_3.jpg'),
    (LOAD_FILE('/images/BlankHanukkah_4.jpg'), 'BlankHanukkah_4.jpg'),
    (LOAD_FILE('/images/BlankHanukkah_5.jpg'), 'BlankHanukkah_5.jpg'),  
    (LOAD_FILE('/images/BlankChristmas_1.jpg'), 'BlankChristmas_1.jpg'),
    (LOAD_FILE('/images/BlankChristmas_2.jpg'), 'BlankChristmas_2.jpg'),
    (LOAD_FILE('/images/BlankChristmas_3.jpg'), 'BlankChristmas_3.jpg'),
    (LOAD_FILE('/images/BlankChristmas_4.jpg'), 'BlankChristmas_4.jpg'),
    (LOAD_FILE('/images/BlankChristmas_5.jpg'), 'BlankChristmas_5.jpg'),
    (LOAD_FILE('/images/BlankKwanzaa_1.jpg'), 'BlankKwanzaa_1.jpg'),
    (LOAD_FILE('/images/BlankKwanzaa_2.jpg'), 'BlankKwanzaa_2.jpg'),
    (LOAD_FILE('/images/BlankKwanzaa_3.jpg'), 'BlankKwanzaa_3.jpg'),
    (LOAD_FILE('/images/BlankKwanzaa_4.jpg'), 'BlankKwanzaa_4.jpg'),
    (LOAD_FILE('/images/BlankKwanzaa_5.jpg'), 'BlankKwanzaa_5.jpg');
"

echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--- SQL READY ---
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
