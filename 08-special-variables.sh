#!/bin/bash

# ctrl+s ---> save the file after making changes
# Author :: Yeswanth
# Team :: DevOps


echo "all arguments passed to the script: $@"
echo "no. of arguments passed to the script: $#"
echo "name of the script: $0"
echo "current working directory: $PWD"
echo "current user home directory: $HOME"
echo "PID of the script $0: $$"
sleep 100 &     # & --> to run a command in background
echo "PID of the last background command: $!"
ls -l       # exit status:: 0 --> success ; 1 to 127 --> failed
echo "status of previous command: $?"