#!/bin/bash


USER_ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d '.' -f1)
LOG_FILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

R="\E[31m" # Red
G="\E[32m" # Green
Y="\E[33m" # Yellow

echo -e "$Y Script started at $TIMESTAMP $Y"

VALIDATE () {
    if ([ $1 -ne 0 ])
        then
            echo -e "$2 & $1 is...$R failed $Y"
            exit 1
    else
        echo -e "$2 & $1 is installed...$G successfully $Y"
    fi
}

if ([ $USER_ID -ne 0 ])
 then
    echo -e "$Y Please run this script as the root user $Y"
    exit 1 # manually exit the script with a non-zero exit code
else 
    echo -e "$Y you are super user $Y"
fi

dnf install mysql-server -y &>> $LOG_FILE
VALIDATE $? "Installation of mysql-server"

dnf install git -y &>> $LOG_FILE
VALIDATE $? "Installation of git"

dnf install dockerR -y &>> $LOG_FILE
VALIDATE $? "Installation of docker"

echo -e "$Y is script proceeding...? $Y"