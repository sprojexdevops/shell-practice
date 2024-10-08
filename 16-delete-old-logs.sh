#!/bin/bash

SOURCE_DIR=/home/ec2-user/logs

# colors
R="\e[31m"      # red
G="\e[32m"      # green
Y="\e[33m"      # yellow
B="\e[34m"
N="\e[0m"       # normal or no color

if [ -d $SOURCE_DIR ]       # '-d <directory-path/variable>' to check if dir exists; '! -d <directory-path/variable>' to check if dir does not exist
then
    echo -e "$SOURCE_DIR $G Exists $N"
else
    echo -e "$SOURCE_DIR $R does not exist $N"
    exit 1
fi

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +14)
echo "Files: $FILES"

# dont use line, it is reserverd word
while IFS= read -r file #IFS,internal field seperatpor, empty it will ignore while space.-r is for not to ingore special charecters like /
do
    echo -e "$Y Deleting file:$N $file"
    rm -rf $file
done <<< $FILES 