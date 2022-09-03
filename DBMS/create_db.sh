#!/bin/bash
echo -n "Enter the Database name : "
read db_name


if [ -d DBMS/$db_name ]
then
    
	echo "Failed, DB Name May Exist"

else

    mkdir -p  DBMS/$db_name 2>>error.log #Logs to review errors later
	echo "Created Successfully"

fi	
