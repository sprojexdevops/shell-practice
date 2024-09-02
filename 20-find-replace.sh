#!/bin/bash


DIR=$1
SEARCH_WORD=$2
NEW_WORD=$3

# colors
R="\e[31m"      # red
G="\e[32m"      # green
Y="\e[33m"      # yellow
B="\e[34m"
N="\e[0m"       # normal or no color

USAGE(){
    echo -e "$R USAGE:: $N sh $0 <file-name along with path> <search word> <new word>"
}
#check the source and destination are provided

if [ $# -lt 3 ]
then
    USAGE
    exit 1
fi


if [ -d $DIR ]
then
    echo -e "$DIR $G directory exist $N"
    $FILES=$(find $DIR -name "*.txt")
    if [ -z $FILE ]
    then
        echo -e "$(echo "$FILES" | wc -l) $G Text files found $N in the directory $DIR :: $FILES"
        while IFS= read -r file #IFS,internal field seperatpor, empty it will ignore while space.-r is for not to ingore special charecters like /
        do
            echo -e "$Y Finding the word $SEARCH_WORD Replacing it with $NEW_WORD the :$N $file"
            sed -i 's/$SEARCH_WORD/${NEW_WORD}/gi' $file
        done <<< $FILES
    else
        echo -e "$R No Text files $N found in the directory $DIR"
    fi
else
    echo -e "$DIR $R directory does not exist $N"
    exit 1
fi

