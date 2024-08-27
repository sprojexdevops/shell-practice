#!/bin/bash

# ctrl+s ---> save the file after making changes
# Author :: Yeswanth
# Team :: DevOps

# run the script as sh <script file> if root user or sudo sh <script file> if normal user with root permissions

USERID=$(id -u)     # gets the user id of the user running the script; root - 0; if the script is executed with sudo it gives 0


VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2..... failed"
        exit 1
    else
        echo "$2..... success"
    fi
}


if [ $USERID -ne 0]
then
    echo "please run the script with root privileges"
    exit 1
fi

dnf list installed mysql

VALIDATE $? "listing mysql"

if [ $? -ne 0 ]
then
    echo "mysql is not installed..... proceeding to install it"
    dnf install mysql -y
    VALIDATE $? "mysql installation"    
else
    echo "mysql is already installed....... nothing to do"
fi