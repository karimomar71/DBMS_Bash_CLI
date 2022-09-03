#!/bin/bash 

read -p  "Enter DB Name : " name

if [ -d DBMS/$name ]
then
        read -p "Are you sure You Want To Delete $name ? (Y/N) : " choice

        case $choice in
                [yY]*) rm -r DBMS/$name; echo "$name Deleted Successfully";; # Remove DB if confirmed
                [nN]*) echo " Operation Canceled";; # Cancel the operation
                *) echo "Invalid option";; 
        esac
else
        echo "$name Database Not Exist" 
fi

