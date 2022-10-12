#!/bin/bash
echo -n "Enter the Database name : "
read -r db_name

if [[ $db_name =~ ^[0-9] ]]; then #check if the value starts with a number
echo "The entered value starts with a number"

elif [ -d DBMS/$db_name ]
then
    
	echo "Failed, DB Name May Exist"

else

    mkdir -p  DBMS/$db_name 2>>error.log #Logs to review errors later
	echo "Created Successfully"

fi	
