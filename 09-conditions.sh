#!/bin/bash

# ctrl+s ---> save the file after making changes
# Author :: Yeswanth
# Team :: DevOps


NUMBER=$1

if [ $NUMBER -gt 20 ]   # gt, lt, eq, ne, ge, le
then
    echo "$NUMBER is greater than 20"
else
    echo "$NUMBER is less than or equal to 20"
fi