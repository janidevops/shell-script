#!/bin/bash

USER_ID=$(id -u)

if ([ $USER_ID -ne 0 ])
 then
    echo "Please run this script as the root user"
    exit 1 # manually exit the script with a non-zero exit code
else 
    echo "you are super user"
fi

dnf install mysql-serverghgh -y
if [ $? -ne 0 ]
    then 
    echo "Mysql-serever is failed..."
    exit 1
else
    echo "Mysql-server is installed successfully..."
fi

dnf install git -y
if [ $? -ne 0 ]
    then 
    echo "Git is failed..."
    exit 1
else
    echo "Git is installed successfully..."
fi



echo "is script proceeding...?"