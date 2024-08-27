#!/bin/bash

# ctrl+s ---> save the file after making changes
# Author :: Yeswanth
# Team :: DevOps

# need to pass values as arguments for the below variables while executing this script

NUMBER1=$1
NUMBER2=$2

# variable can be called in 2 ways --> $variable_name or ${variable_name}

SUM=$(($NUMBER1+$NUMBER2))  # $() --> to execute the command; paranthesis with () is to perform the operation
echo "Sum of $NUMBER1 and $NUMBER2 is: $SUM"
