#!/bin/bash

echo "Please Enter your username:: "
read USERNAME # read command is used to take input from the user and store it in the variable USERNAME in terminal
echo "Please Enter your password:: " 
read -s PASSWORD  # read -s is used to hide the password input from the terminal
echo

echo "Your username is $USERNAME and your password is $PASSWORD"