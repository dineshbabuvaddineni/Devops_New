#!/bin/bash

USERID=$(id -u)

R='\e[31m' # Red
G='\e[32m' # Green
Y='\e[33m' # Yellow
N='\e[0m'  # No colour

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

# Create log folder if not exists
#mkdir -p $LOGS_FOLDER

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 ..... $R FAILURE $N"
        exit 1
    else
        echo -e "$2 ..... $G SUCCESS $N"
    fi
}

echo "Script started executing at $TIMESTAMP" &>> $LOG_FILE_NAME

if [ $USERID -ne 0 ]
then
    echo "ERROR :: You must have sudo access to execute the script"
    exit 1
fi

# MYSQL
dnf list installed mysql &>> $LOG_FILE_NAME
if [ $? -ne 0 ]
then
    dnf install mysql -y &>> $LOG_FILE_NAME
    VALIDATE $? "Installing MYSQL"
else
    echo -e "MYSQL is already ..... $Y Installed $N"
fi

# GIT
dnf list installed git &>> $LOG_FILE_NAME
if [ $? -ne 0 ]
then
    dnf install git -y &>> $LOG_FILE_NAME
    VALIDATE $? "Installing git"
else
    echo -e "git is already ..... $Y Installed $N"
fi