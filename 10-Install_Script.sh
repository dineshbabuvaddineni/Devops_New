#!/bin/bash

USERID=$(id -u)

if[ $USERID -ne 0 ]
then
    echo "ERROR :: You must have sudo access to eccute the te script"
fi

dnf install mysqll -y 

