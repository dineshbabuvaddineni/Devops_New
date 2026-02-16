#!/bin/bash

echo "All Variables passed : $@"
echo "number os variables passed $#"
echo "Script Name : $0"
echo "present working directory :$PWD"
echo "Which user is running this script : $USER"
echo "process id of current script : $$"
sleep 60 &
echo "process id of last command in background :$!"