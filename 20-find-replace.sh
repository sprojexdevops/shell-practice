#!/bin/bash


DIR=$1
FILE_TYPE=$2
SEARCH_WORD=$3
NEW_WORD=$4

# colors
R="\e[31m"      # red
G="\e[32m"      # green
Y="\e[33m"      # yellow
B="\e[34m"
N="\e[0m"       # normal or no color

USAGE(){
    echo -e "$R USAGE:: $N sh $0 <Directory path> <file type, eg: txt, log... without dot> <search word> <new word>"
}
#check the required inputs are passed

if [ $# -lt 4 ]
then
    USAGE
    exit 1
fi


if [ -d $DIR ]
then
    echo -e "$DIR $G directory exist $N"
    FILES=$(find $DIR -name "*.$FILE_TYPE")
    if [ -z $FILES ]
    then
        echo -e "'.$FILE_TYPE' files $R not found $N in the directory $DIR"        
    else
        echo -e "$(echo "$FILES" | wc -l) '.$FILE_TYPE' files $G found $N in the directory $DIR :: $FILES"
        while IFS= read -r file #IFS,internal field seperatpor, empty it will ignore while space.-r is for not to ingore special charecters like /
        do
            cat $file | grep -i $SEARCH_WORD &>> /dev/null
            if [ $? -eq 0 ]
            then
                echo -e "Found the word $Y $SEARCH_WORD $N and Replacing it with $B $NEW_WORD $N in file: $file"
                sed -i 's/'$SEARCH_WORD'/'${NEW_WORD}'/gi' $file
            else
                echo -e "$Y $SEARCH_WORD $N word $R does not exist $N in file: $file"
            fi
        done <<< $FILES
    fi
else
    echo -e "$DIR $R directory does not exist $N"
    exit 1
fi

