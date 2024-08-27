#!/bin/bash

# ctrl+s ---> save the file after making changes
# Author :: Yeswanth
# Team :: DevOps

echo "Enter your username:"
read username   # takes input into username variable
echo "Enter you password:"
read -s password    # takes input into password variable without displaying the value on the terminal

echo "Entered values are -"
echo "username: $username"
echo "password: $password"  # this is just to test the entered value but should not be used in real time