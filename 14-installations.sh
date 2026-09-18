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

VALIDATE () {
    if ([ $1 -ne 0 ])
        then
            echo -e "$2 is...$R failed $N"
            exit 1
    else
        echo -e "$2 is installed...$G successfully $N"
    fi
}

for i in $@
    do 
        echo "package to install: $i"
        dnf list installed $i &>>$LOGFILE
        if ([ $? -eq 0 ])
            then 
                echo -e "Package $i is already installed... $Y SKIPPING $N"
            else
                dnf install $i -y &>>$LOG_FILE
                VALIDATE $? "Installation of $i"
        fi
    done