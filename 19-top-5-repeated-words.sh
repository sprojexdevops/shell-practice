#!/bin/bash


FILE_NAME=$1
WORD_COUNT=${2:-5}

FILE=$(find $FILE_NAME)


if [ ! -z $FILE ]
then
    echo "$FILE_NAME exists"
    Freq_Five_Words=$(tr '[:space:]' '[\n*]' < ${FILE_NAME} | tr 'A-Z' 'a-z' | sort | uniq -c | sort -nr | head -$WORD_COUNT)
    echo "$Freq_Five_Words"
else
    echo "$FILE_NAME does not exist"
fi