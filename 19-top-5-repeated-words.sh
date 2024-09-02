#!/bin/bash


FILE_NAME=$1
WORD_COUNT=${2:-5}

USAGE(){
    echo -e "$R USAGE:: $N sh $0 <file name along with path> <number of top repeated words (optional)>"
}
#check the source and destination are provided

if [ $# -lt 1 ]
then
    USAGE
    exit 1
fi


FILE=$(find $FILE_NAME)


if [ ! -f $FILE ]
then
    echo "$FILE_NAME exists"
    Freq_Words=$(tr '[:space:]' '[\n*]' < ${FILE_NAME} | tr 'A-Z' 'a-z' | sort | uniq -c | sort -nr | head -$WORD_COUNT)
    echo "Top $WORD_COUNT repeated words in $FILE_NAME :: $Freq_Words"
else
    echo "$FILE_NAME does not exist"
fi