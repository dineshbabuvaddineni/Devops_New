#!/bin/bash

USERID=$(id -u)
R='\e[31m' # Red]
G='\e[32m' # Green
Y='\e[33m' # Yellow

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e     "$2 .....$R FAILURE"
        exit 1
    else
        echo -e "$2 ..... $G SUCCESS"
    fi

}

if [ $USERID -ne 0 ]
then
    echo "ERROR :: You must have sudo access to execute the script"
    exit 1
fi

dnf list installed mysql 
if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "Installing MYSQL"
else
    echo -e "MYSQL is already .....$Y Installed"
fi

dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Installing git"
else
    echo -e "git is already ....$Y Installed"
fi
