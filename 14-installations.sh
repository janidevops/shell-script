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
    do echo "Install package : $i"
done