#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR :: You must have sudo access to execute the script"
    exit 1
fi

dnf install mysqll -y

if [ $? -ne 0]
then
    echo "Installing MYSQL .....FAILURE"
    exit 1
else
    echo "Installing MYSQL ..... SUCCESS"
fi

dnf install git -y

if [ $? -ne 0]
then
    echo "Installing git .....FAILURE"
    exit 1
else
    echo "Installing git ..... SUCCESS"
fi
