#!/bin/bash

# ctrl+s ---> save the file after making changes
# Author :: Yeswanth
# Team :: DevOps

# run the script as sh <script file> if root user or sudo sh <script file> if normal user with root permissions

LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"

mkdir -p $LOG_FOLDER



USERID=$(id -u)                     # gets the user id of the user running the script; root - 0; if the script is executed with sudo it gives 0

# colors
R="\e[31m"      # red
G="\e[32m"      # green
Y="\e[33m"      # yellow
B="\e[34m"
N="\e[0m"       # normal or no color


USAGE(){
    echo -e "$R USAGE:: $N sudo sh $0 package1 package2 ......."
    exit 1
}

VALIDATE(){                 # function to validate the installation
    if [ $1 -ne 0 ]
    then
        echo -e "$2..... $R failed $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "$2..... $G success $N" | tee -a $LOG_FILE
    fi
}

INSTALL(){                      # function to install the given package if not installed already
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is $B not installed $N..... proceeding to install it" | tee -a $LOG_FILE
        dnf install $2 -y &>>$LOG_FILE
        VALIDATE $? "$2 installation"    
    else
        echo -e "$2 is $Y already installed $N....... nothing to do" | tee -a $LOG_FILE
    fi
}

echo "$0 started executing at: $(date)" | tee -a $LOG_FILE

if [ $# -eq 0]
then
    USAGE
fi


if [ $USERID -ne 0]
then
    echo -e "$R please run the script with root privileges $N" | tee -a $LOG_FILE
    exit 1
fi




# example: sudo sh 13-loops.sh git nginx mysql postfix

for package in $@       # refers to all arguments passed to the script
do
    dnf list installed $package &>>$LOG_FILE
    INSTALL $? $package
done

