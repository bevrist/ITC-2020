#!/bin/bash
if [ -f "sql-setup-success.txt" ]; then
    echo "SQL already initialized. skipping setup..."
    exit
fi
touch sql-setup-success.txt
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

CREATE TABLE SampleCards (HolidayID int, image_id INT(10) auto_increment, Image MEDIUMBLOB NOT NULL, Image_Filename VARCHAR(50) NOT NULL, user_img_pos_x int, user_img_pos_y int, resize_img_len int, resize_img_wid int, PRIMARY KEY(image_id));

INSERT INTO gnomedb.SampleCards(Image, Image_Filename, HolidayID, user_img_pos_x, user_img_pos_y, resize_img_len, resize_img_wid) VALUES
  (LOAD_FILE('/images/Easter/eb5.png'), 'eb5.png', 5, 780, 180, 950, 530),
  (LOAD_FILE('/images/Easter/eb4.png'), 'eb4.png', 5, 525, 180, 950, 530),
  (LOAD_FILE('/images/Easter/eb3.png'), 'eb3.png', 5, 125, 50, 950, 530),
  (LOAD_FILE('/images/Easter/eb2.png'), 'eb2.png', 5, 800, 180, 950, 530),
  (LOAD_FILE('/images/Easter/eb1.png'), 'eb1.png', 5, 525, 180, 950, 530),
  (LOAD_FILE('/images/Easter/BlankEaster_1.jpg'), 'BlankEaster_1.jpg', 5, 525, 180, 950, 530),
  (LOAD_FILE('/images/FathersDay/BlankFathersDay_1.jpg'), 'BlankFathersDay_1.jpg', 6, 10, 10, 950, 530),
  (LOAD_FILE('/images/FathersDay/BlankFathersDay_3.jpg'), 'BlankFathersDay_3.jpg', 6, 10, 10, 950, 530),
  (LOAD_FILE('/images/FathersDay/BlankFathersDay_2.jpg'), 'BlankFathersDay_2.jpg', 6, 10, 10, 950, 530),
  (LOAD_FILE('/images/FathersDay/BlankFathersDay_5.jpg'), 'BlankFathersDay_5.jpg', 6, 10, 10, 950, 530),
  (LOAD_FILE('/images/FathersDay/BlankFathersDay_4.jpg'), 'BlankFathersDay_4.jpg', 6, 10, 10, 950, 530),
  (LOAD_FILE('/images/Halloween/halBlank3.png'), 'halBlank3.png', 8, 750, 180, 950, 530),
  (LOAD_FILE('/images/Halloween/halBlank2.png'), 'halBlank2.png', 8, 525, 10, 950, 530),
  (LOAD_FILE('/images/Halloween/halBlank1.png'), 'halBlank1.png', 8, 10, 10, 950, 530),
  (LOAD_FILE('/images/Halloween/halBlank6.png'), 'halBlank6.png', 8, 525, 180, 950, 530),
  (LOAD_FILE('/images/Halloween/BlankHalloween_3.jpg'), 'BlankHalloween_3.jpg', 8, 750, 50, 950, 530),
  (LOAD_FILE('/images/Halloween/BlankHalloween_2.jpg'), 'BlankHalloween_2.jpg', 8, 150, 10, 950, 530),
  (LOAD_FILE('/images/HomePageImage/hwf1.png'), 'hwf1.png', 0, 0, 0, 0, 0),
  (LOAD_FILE('/images/HomePageImage/hwf2.png'), 'hwf2.png', 0, 0, 0, 0, 0),
  (LOAD_FILE('/images/HomePageImage/july1.png'), 'july1.png', 0, 0, 0, 0, 0),
  (LOAD_FILE('/images/HomePageImage/vc1.png'), 'vc1.png', 0, 0, 0, 0, 0),
  (LOAD_FILE('/images/HomePageImage/h1.png'), 'h1.png', 0, 0, 0, 0, 0),
  (LOAD_FILE('/images/HomePageImage/c1.png'), 'c1.png', 0, 0, 0, 0, 0),
  (LOAD_FILE('/images/HomePageImage/ef1.png'), 'ef1.png', 0, 0, 0, 0, 0),
  (LOAD_FILE('/images/HomePageImage/md1.png'), 'md1.png', 0, 0, 0, 0, 0),
  (LOAD_FILE('/images/HomePageImage/ef2.png'), 'ef2.png', 0, 0, 0, 0, 0),
  (LOAD_FILE('/images/ValentinesDay/BlankValentines_2.jpg'), 'BlankValentines_2.jpg', 2, 475, 180, 950, 530),
  (LOAD_FILE('/images/ValentinesDay/BlankValentines_3.jpg'), 'BlankValentines_3.jpg', 2, 475, 180, 950, 530),
  (LOAD_FILE('/images/ValentinesDay/BlankValentines_1.jpg'), 'BlankValentines_1.jpg', 2, 475, 180, 950, 530),
  (LOAD_FILE('/images/ValentinesDay/BlankValentines_4.jpg'), 'BlankValentines_4.jpg', 2, 475, 180, 950, 530),
  (LOAD_FILE('/images/ValentinesDay/val4.png'), 'val4.png', 2, 475, 180, 950, 530),
  (LOAD_FILE('/images/ValentinesDay/val5.png'), 'val5.png', 2, 475, 180, 950, 530),
  (LOAD_FILE('/images/ValentinesDay/val2.png'), 'val2.png', 2, 40, 180, 950, 530),
  (LOAD_FILE('/images/ValentinesDay/val3.png'), 'val3.png', 2, 40, 10, 950, 530),
  (LOAD_FILE('/images/ValentinesDay/val1.png'), 'val1.png', 2, 1000, 80, 845, 570),
  (LOAD_FILE('/images/4thJuly/julyBlank4.png'), 'julyBlank4.png', 7, 475, 180, 950, 530),
  (LOAD_FILE('/images/4thJuly/julyBlank5.png'), 'julyBlank5.png', 7, 475, 180, 950, 530),
  (LOAD_FILE('/images/4thJuly/julyBlank1.png'), 'julyBlank1.png', 7, 10, 10, 950, 530),
  (LOAD_FILE('/images/4thJuly/julyBlank2.png'), 'julyBlank2.png', 7, 850, 100, 950, 530),
  (LOAD_FILE('/images/4thJuly/julyBlank3.png'), 'julyBlank3.png', 7, 850, 180, 950, 530),
  (LOAD_FILE('/images/Kwanza/BlankKwanzaa_5.jpg'), 'BlankKwanzaa_5.jpg', 13, 10, 10, 950, 530),
  (LOAD_FILE('/images/Kwanza/BlankKwanzaa_4.jpg'), 'BlankKwanzaa_4.jpg', 13, 10, 10, 950, 530),
  (LOAD_FILE('/images/Kwanza/BlankKwanzaa_1.jpg'), 'BlankKwanzaa_1.jpg', 13, 10, 10, 950, 530),
  (LOAD_FILE('/images/Kwanza/BlankKwanzaa_3.jpg'), 'BlankKwanzaa_3.jpg', 13, 10, 10, 950, 530),
  (LOAD_FILE('/images/Kwanza/BlankKwanzaa_2.jpg'), 'BlankKwanzaa_2.jpg', 13, 10, 10, 950, 530),
  (LOAD_FILE('/images/MothersDay/mother5.png'), 'mother5.png', 4, 800, 180, 950, 530),
  (LOAD_FILE('/images/MothersDay/mother4.png'), 'mother4.png', 4, 530, 180, 950, 530),
  (LOAD_FILE('/images/MothersDay/mother1.png'), 'mother1.png', 4, 850, 100, 950, 530),
  (LOAD_FILE('/images/MothersDay/mother3.png'), 'mother3.png', 4, 800, 10, 950, 530),
  (LOAD_FILE('/images/MothersDay/mother2.png'), 'mother2.png', 4, 870, 180, 950, 530),
  (LOAD_FILE('/images/Christmas/cb3.png'), 'cb3.png', 12, 525, 180, 950, 530),
  (LOAD_FILE('/images/Christmas/cb2.png'), 'cb2.png', 12, 525, 180, 950, 530),
  (LOAD_FILE('/images/Christmas/cb1.png'), 'cb1.png', 12, 525, 180, 950, 530),
  (LOAD_FILE('/images/Christmas/cb5.png'), 'cb5.png', 12, 525, 180, 950, 530),
  (LOAD_FILE('/images/Christmas/cb4.png'), 'cb4.png', 12, 525, 180, 950, 530),
  (LOAD_FILE('/images/Diwali/BlankDiwali_2.jpg'), 'BlankDiwali_2.jpg', 9, 10, 10, 950, 530),
  (LOAD_FILE('/images/Diwali/BlankDiwali_3.jpg'), 'BlankDiwali_3.jpg', 9, 10, 10, 950, 530),
  (LOAD_FILE('/images/Diwali/BlankDiwali_1.jpg'), 'BlankDiwali_1.jpg', 9, 10, 10, 950, 530),
  (LOAD_FILE('/images/Diwali/BlankDiwali_4.jpg'), 'BlankDiwali_4.jpg', 9, 10, 10, 950, 530),
  (LOAD_FILE('/images/Diwali/BlankDiwali_5.jpg'), 'BlankDiwali_5.jpg', 9, 10, 10, 950, 530),
  (LOAD_FILE('/images/Thanksgiving/BlankThankgiving_1.jpg'), 'BlankThankgiving_1.jpg', 10, 20, 80, 950, 530),
  (LOAD_FILE('/images/Thanksgiving/BlankThankgiving_3.jpg'), 'BlankThankgiving_3.jpg', 10, 475, 180, 950, 530),
  (LOAD_FILE('/images/Thanksgiving/BlankThankgiving_2.jpg'), 'BlankThankgiving_2.jpg', 10, 475, 180, 950, 530),
  (LOAD_FILE('/images/Thanksgiving/BlankThankgiving_5.jpg'), 'BlankThankgiving_5.jpg', 10, 20, 80, 950, 530),
  (LOAD_FILE('/images/Thanksgiving/BlankThankgiving_4.jpg'), 'BlankThankgiving_4.jpg', 10, 475, 180, 950, 530),
  (LOAD_FILE('/images/StPatrickDay/BlankSaintPats_5.jpg'), 'BlankSaintPats_5.jpg', 3, 10, 10, 950, 530),
  (LOAD_FILE('/images/StPatrickDay/BlankSaintPats_4.jpg'), 'BlankSaintPats_4.jpg', 3, 10, 10, 950, 530),
  (LOAD_FILE('/images/StPatrickDay/BlankSaintPats_3.jpg'), 'BlankSaintPats_3.jpg', 3, 10, 10, 950, 530),
  (LOAD_FILE('/images/StPatrickDay/BlankSaintPats_2.jpg'), 'BlankSaintPats_2.jpg', 3, 10, 10, 950, 530),
  (LOAD_FILE('/images/StPatrickDay/BlankSaintPats_1.jpg'), 'BlankSaintPats_1.jpg', 3, 10, 10, 950, 530),
  (LOAD_FILE('/images/Hanukkah/BlankHanukkah_5.jpg'), 'BlankHanukkah_5.jpg', 11, 10, 10, 950, 530),
  (LOAD_FILE('/images/Hanukkah/BlankHanukkah_4.jpg'), 'BlankHanukkah_4.jpg', 11, 10, 10, 950, 530),
  (LOAD_FILE('/images/Hanukkah/BlankHanukkah_3.jpg'), 'BlankHanukkah_3.jpg', 11, 10, 10, 950, 530),
  (LOAD_FILE('/images/Hanukkah/BlankHanukkah_2.jpg'), 'BlankHanukkah_2.jpg', 11, 10, 10, 950, 530),
  (LOAD_FILE('/images/Hanukkah/BlankHanukkah_1.jpg'), 'BlankHanukkah_1.jpg', 11, 10, 10, 950, 530);
"

echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--- SQL READY ---
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"

touch sql-setup-success.txt