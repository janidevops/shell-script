#!/bin/bash

USER_ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d '.' -f1)
LOG_FILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

R="\e[31m" # Red
G="\e[32m" # Green
Y="\e[33m" # Yellow
B="\e[34m" # Blue
N="\e[0m" # Normal

if ([ $USER_ID -ne 0 ])
 then
    echo -e "$Y Please run this script as the root user $N"
    exit 1 # manually exit the script with a non-zero exit code
else 
    echo -e "$G you are super user $N"
fi

for i in $@
    do 
        echo "Install package : $i"

        dnf list install $i &>>$LOG_FILE #here we are using dnf list install to check if the package is available for installation and then installing it.
        
        if ([ $? -eq 0 ])
            then 
                echo -e "Package $i is already installed... $Y SKIPPING $N"
            else
                echo -e "$i is Not installed... $B need to install $N"
        fi
    done