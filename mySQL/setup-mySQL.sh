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

run commands against the 'gnomedb' database
mysql -u root -p$SQL_PASSWORD gnomedb -e "

CREATE TABLE Holidays (HolidayName varchar(255), HolidayID int);
INSERT INTO Holidays (HolidayName, HolidayID) Values (('Christmas', '12'), ('Thanksgiving', '10'), ('Mother's Day', '4'), ('Easter', '5'), ('Fourth of July', '7'), 
                                                      ('Father's Day', '6'), ('Halloween', '8'), ('Valentine's Day', '2'),('Saint Patrick's Day', '3'), 
                                                      ('New Year's', '1'), ('Hanukkah', '11'), ('Kwanzaa', '13'), ('Diwali', '9'));
CREATE TABLE 'SampleCards` (
  `image_id` INT(10) NOT NULL,
  `Image` BLOB NULL,
  PRIMARY KEY (`image_id`));

Insert Into gnomedb.SampleCards Values("1", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankNewYears_1.jpg'), 
                                     ("2", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankNewYears_2.jpg'),
                                     ("3", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankNewYears_3.jpg'),
                                     ("4", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankNewYears_4.jpg'),
                                     ("5", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankNewYears_5.jpg'),
                                     ("6", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankValentines_1.jpg'),
                                     ("7", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankValentines_2.jpg'),
                                     ("8", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankValentines_3.jpg'),
                                     ("9", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankValentines_4.jpg'),
                                     ("10", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankValentines_5.jpg'),
                                     ("11", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankSaintPats_1.jpg'),
                                     ("12", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankSaintPats_2.jpg'),
                                     ("13", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankSaintPats_3.jpg'),
                                     ("14", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankSaintPats_4.jpg'),
                                     ("15", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankSaintPats_5.jpg'),
                                     ("16", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankMothersDay_1.jpg'),
                                     ("17", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankMothersDay_2.jpg'),
                                     ("18", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankMothersDay_3.jpg'),
                                     ("19", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankMothersDay_4.jpg'),
                                     ("20", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankMothersDay_5.jpg'),
                                     ("21", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankEaster_1.jpg'),
                                     ("22", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankEaster_2.jpg'),
                                     ("23", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankEaster_3.jpg'),
                                     ("24", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankEaster_4.jpg'),
                                     ("25", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankEaster_5.jpg'),
                                     ("26", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankEaster_6.jpg'),
                                     ("27", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankFathersDay_1.jpg'),
                                     ("28", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankFathersDay_2.jpg'),
                                     ("29", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankFathersDay_3.jpg'),
                                     ("30", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankFathersDay_4.jpg'),
                                     ("31", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankFathersDay_5.jpg'),
                                     ("32", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankFourthofJuly_1.jpg'),
                                     ("33", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankFourthofJuly_2.jpg'),
                                     ("34", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankFourthofJuly_3.jpg'),
                                     ("35", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankFourthofJuly_4.jpg'),
                                     ("36", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankFourthofJuly_5.jpg'),
                                     ("37", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankHalloween_1.jpg'),
                                     ("38", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankHalloween_2.jpg'),
                                     ("39", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankHalloween_3.jpg'),
                                     ("40", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankHalloween_4.jpg'),
                                     ("41", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankHalloween_5.jpg'),
                                     ("42", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankHalloween_6.jpg'),
                                     ("43", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankDiwali_1.jpg'),
                                     ("44", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankDiwali_2.jpg'),
                                     ("45", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankDiwali_3.jpg'),
                                     ("46", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankDiwali_4.jpg'),
                                     ("47", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankDiwali_5.jpg'),
                                     ("48", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankThanksgiving_1.jpg'),
                                     ("49", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankThanksgiving_2.jpg'),
                                     ("50", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankThanksgiving_3.jpg'),
                                     ("51", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankThanksgiving_4.jpg'),
                                     ("52", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankThanksgiving_5.jpg'),
                                     ("53", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankHanukkah_1.jpg'),
                                     ("54", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankHanukkah_2.jpg'),
                                     ("55", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankHanukkah_3.jpg'),
                                     ("56", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankHanukkah_4.jpg'),
                                     ("57", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankHanukkah_5.jpg'),
                                     ("58", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankHanukkah_6.jpg'),
                                     ("59", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankChristmas_1.jpg'),
                                     ("60", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankChristmas_2.jpg'),
                                     ("61", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankChristmas_3.jpg'),
                                     ("62", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankChristmas_4.jpg'),
                                     ("63", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankChristmas_5.jpg'),
                                     ("64", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankChristmas_6.jpg'),
                                     ("65", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankKwanzaa_1.jpg'),
                                     ("66", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankKwanzaa_2.jpg'),
                                     ("67", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankKwanzaa_3.jpg'),
                                     ("68", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankKwanzaa_4.jpg'),
                                     ("69", 'C:/Users/Jordan/Desktop/ITC-2020/HolidayCards/FamilyCards/BlankKwanzaa_5.jpg'),;
 "

echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--- SQL READY ---
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"