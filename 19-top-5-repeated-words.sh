#!/bin/bash


FILE_NAME=$1


FILE=$(find $FILE_NAME)


if [ ! -z $FILE ]
then
    echo "$FILE_NAME exists"
    Freq_Five_Words=$(tr '[:space:]' '[\n*]' < ${FILE_NAME} | sort | uniq -c | sort -nr | head -5)
    echo "$Freq_Five_Words"
else
    echo "$FILE_NAME does not exist"
fi