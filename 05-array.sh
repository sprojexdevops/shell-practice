#!/bin/bash

# ctrl+s ---> save the file after making changes
# Author :: Yeswanth
# Team :: DevOps

FRUITS=("apple" "mango" "kiwi")

# variable can be called in 2 ways --> $variable_name or ${variable_name}

echo "1st fruit: $FRUITS[0]"
echo "2nd fruit: ${FRUITS[1]}"
echo "3rd fruit: ${FRUITS[2]}"

echo "all fruits: ${FRUITS[@]}"