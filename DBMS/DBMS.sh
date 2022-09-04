#!/bin/bash
while true;
do
tput bold setaf 2; #change font color to Green
tput setaf 3; #change font color to Yellow


echo "
██ ████████ ██     ██████   ██████  ██████  ██████  
██    ██    ██          ██ ██  ████      ██      ██ 
██    ██    ██      █████  ██ ██ ██  █████   █████  
██    ██    ██     ██      ████  ██ ██      ██      
██    ██    ██     ███████  ██████  ███████ ███████                                                                                                             "
tput bold setaf 2; #change font color to Green
tput setaf 2; #change font color to Yellow

echo  '
 /$$   /$$          /$$$$$$        /$$$$$$$  /$$      /$$ /$$$$$$$   /$$$$$$ 
| $$  /$$/         /$$__  $$      | $$__  $$| $$$    /$$$| $$__  $$ /$$__  $$
| $$ /$$/         | $$  \ $$      | $$  \ $$| $$$$  /$$$$| $$  \ $$| $$  \__/
| $$$$$/          | $$$$$$$$      | $$  | $$| $$ $$/$$ $$| $$$$$$$ |  $$$$$$ 
| $$  $$          | $$__  $$      | $$  | $$| $$  $$$| $$| $$__  $$ \____  $$
| $$\  $$         | $$  | $$      | $$  | $$| $$\  $ | $$| $$  \ $$ /$$  \ $$
| $$ \  $$        | $$  | $$      | $$$$$$$/| $$ \/  | $$| $$$$$$$/|  $$$$$$/
|__/  \__/ /$$$$$$|__/  |__/      |_______/ |__/     |__/|_______/  \______/'

tput bold
echo "+---------------------------+"
echo "| $(tput setaf 2)Welcome to K_A DBMS !$(tput bold setaf 4)     |"
echo "| $(tput setaf 3)Written By: Karim & Arafa$(tput setaf 4) |"
echo "+---------------------------+"
echo "| 1 - Create Database       |"
echo "| 2 - List Databases        |"
echo "| 3 - Connect Database      |"
echo "| 4 - Drop Database         |"
echo "| 5 - Exit                  |"
echo "+---------------------------+"
tput setaf 3; #change font color to Yellow
echo  -n "$(tput setaf 3)Choice : "
read choice
case $choice in
    1)  . ./create_db.sh ;;
    2) ls DBMS 2>> error.log || echo "No Databases Exist" ;; #List (2) option exists here.
    3)  ./connect_db.sh ;;
    4) . ./drop_db.sh ;;
    5) exit;;
    *) echo -e "\n______ Invalid Choice ______\n";;
esac
done
