#! /bin/bash

DBNAME="user_data"

DBEXISTS=$(mysql --batch --skip-column-names -p -e "SHOW DATABASES LIKE '"$dbname"';" | grep "$dbname" > /dev/null; echo "$?")

if [ $DBEXISTS -eq 0 ]
then
	echo "database already exists"
else
	echo "creating database"
	mysql -u root -p -e "CREATE DATABASE $DBNAME; USE $DBNAME; CREATE TABLE users(user_id varchar(30) NOT NULL); CREATE TABLE data(id varchar(30) NOT NULL);"
	#""
fi
