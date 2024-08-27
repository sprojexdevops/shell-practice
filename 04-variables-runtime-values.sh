#!/bin/bash

# ctrl+s ---> save the file after making changes
# Author :: Yeswanth
# Team :: DevOps

echo "Enter your username:"
read USERNAME   # takes input into username variable
echo "Enter you password:"
read -s PASSWORD    # takes input into password variable without displaying the value on the terminal

# variable can be called in 2 ways --> $variable_name or ${variable_name}

echo "Entered values are -"
echo "username: $USERNAME"
echo "password: $PASSWORD"  # this is just to test the entered value but should not be used in real time