#!/bin/bash


USER_ID=$(id -u)

VALIDATE () {
if ([$1 -ne 0])
    then
        echo "$2 is failed..."
        exit 1
else
    echo "$2 is installed successfully..."
fi

}

if ([ $USER_ID -ne 0 ])
 then
    echo "Please run this script as the root user"
    exit 1 # manually exit the script with a non-zero exit code
else 
    echo "you are super user"
fi

dnf install mysql-server -y
VALIDATE $? "Installation of mysql-server"

dnf install git -y
VALIDATE $? "Installation of git"



echo "is script proceeding...?"