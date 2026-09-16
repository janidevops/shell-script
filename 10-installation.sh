#!/bin/bash

USER_ID=$(id -u)

if ([ $USER_ID -ne 0 ])
 then
    echo "Please run this script as the root user"
    exit 1 # manually exit the script with a non-zero exit code
else 
    echo "you are super user"
fi

dnf install mysql-server -y
echo "is script proceeding...?"