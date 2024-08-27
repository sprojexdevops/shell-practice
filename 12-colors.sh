#!/bin/bash

# ctrl+s ---> save the file after making changes
# Author :: Yeswanth
# Team :: DevOps

# run the script as sh <script file> if root user or sudo sh <script file> if normal user with root permissions

USERID=$(id -u)     # gets the user id of the user running the script; root - 0; if the script is executed with sudo it gives 0

# colors

R="\e[31m"      # red
G="\e[32m"      # green
Y="\e[33m"      # yellow
B="\e[34m"
N="\e[0m"       # normal or no color


VALIDATE(){                 # function to validate the installation
    if [ $1 -ne 0 ]
    then
        echo -e "$2..... $R failed $N"
        exit 1
    else
        echo -e "$2..... $G success $N"
    fi
}

INSTALL(){                      # function to install the given package if not installed already
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is $B not installed $N..... proceeding to install it"
        dnf install $2 -y
        VALIDATE $? "$2 installation"    
    else
        echo -e "$2 is $Y already installed $N....... nothing to do"
    fi
}


if [ $USERID -ne 0]
then
    echo "please run the script with root privileges"
    exit 1
fi

dnf list installed mysql

INSTALL $? "mysql"

