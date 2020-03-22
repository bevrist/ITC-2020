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
# mysql -u root -p$SQL_PASSWORD gnomedb -e "

# "

echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--- SQL READY ---
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"