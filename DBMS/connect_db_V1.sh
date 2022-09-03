#! /bin/bash

read -p "Enter Database name: " name

cd DBMS/$name 2>> error.log && #connect to DB
echo "<$name> Database is selected successfully" && #Print success status
(  ../../db_menu.sh "$name" ; cd ../.. ) || 
echo "Database $name doesn't exist" #Print failed status




