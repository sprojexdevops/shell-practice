#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #if $3 is empty, default is 14 days.
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

USAGE(){
    echo -e "$R USAGE:: $N sh $0 <source> <destination> <days(optional)>"
}
#check the source and destination are provided

if [ $# -lt 2 ]
then
    USAGE
    exit 1
fi

if [ ! -d $SOURCE_DIR ]
then
    echo "$SOURCE_DIR does not exist...Please check"
fi

if [ ! -d $DEST_DIR ]
then
    echo "$DEST_DIR does not exist...Please check"
fi

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +${DAYS})

echo "Files: $FILES"

if [ -z $FILES ] # z <files> empty, ! z <files> not empty
then
    echo "No files older than $DAYS days"
else
    file_count=$(echo "$FILES" | wc -l)
    echo "$file_count files are older than ${DAYS} days"
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find ${SOURCE_DIR} -name "*.log" -mtime +${DAYS} | zip "$ZIP_FILE" -@    # @ to zip all files found as input to zip

    #check if zip file is successfully created or not
    if [ -f $ZIP_FILE ]
    then
        echo -e "$B Successfully zippped $N files older than $DAYS days"
        #remove the files after zipping
        while IFS= read -r file #IFS,internal field seperatpor, empty it will ignore while space.-r is for not to ingore special charecters like /
        do
            echo -e "$Y Deleting file:$N $file"
            rm -rf $file
        done <<< $FILES
    else
        echo -e "Zipping the files is $R failed $N"
        exit 1
    fi    
fi