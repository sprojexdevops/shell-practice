#!/bin/bash

# ctrl+s ---> save the file after making changes
# Author :: Yeswanth
# Team :: DevOps

NUMBER1=$1
NUMBER2=$2

# variable can be called in 2 ways --> $variable_name or ${variable_name}

SUM=$((NUMBER1+NUMBER2))
echo "Total sum is: $SUM"
