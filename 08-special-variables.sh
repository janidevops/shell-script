#!/bin/bash
# interview question: What are special variables in shell scripting? Give examples ?.

echo "All arguments/variables passed to the script: $@"
echo "Number of arguments/variables passed to the script: $#"
echo "The name of the script: $0"
echo "current working directory: $PWD"
echo "The process ID of the current script: $$"
echo "Home directory of the current user: $HOME"
echo "which user is executing the script: $USER"
echo "The exit status of the last command executed: $?"
echo "Hostname of the machine: $HOSTNAME"