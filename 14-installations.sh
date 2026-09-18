#!/bin/bash

USER_ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d '.' -f1)
LOG_FILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

R="\E[31m" # Red
G="\E[32m" # Green
Y="\E[33m" # Yellow
B="\E[34m" # Blue

if ([ $USER_ID -ne 0 ])
 then
    echo -e "$Y Please run this script as the root user $Y"
    exit 1 # manually exit the script with a non-zero exit code
else 
    echo -e "$Y you are super user $Y"
fi

for i in $@
    do 
        echo "Install package : $i"

        dnf list install $i &>>$LOG_FILE #here we are using dnf list install to check if the package is available for installation and then installing it.
        
        if ([ $? -eq 0 ])
            then 
                echo "Package $i is already installed...$Y SKIPPING $Y"
            else
                echo "$i is Not installed...$B need to install $B"
        fi
    done