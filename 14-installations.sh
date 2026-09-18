#!/bin/bash

USER_ID=$(id -u)

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

        dnf list install $i &>> $LOG_FILE #here we are using dnf list install to check if the package is available for installation and then installing it.
        
        if ([ $? -eq 0])
            then 
                echo "Package $i is already installed... SKIPPING"
            else
                echo "$i is Not installed... need to install"
        fi
    done