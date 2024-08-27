#!/bin/bash

# ctrl+s ---> save the file after making changes
# Author :: Yeswanth
# Team :: DevOps

PERSON1=Carlo
PERSON2=Pep

# variable can be called in 2 ways --> $variable_name or ${variable_name}

echo "$PERSON1:: Hi ${PERSON2}, How r u?"
echo "${PERSON2}:: Hello $PERSON1, I'm doing good. How abt u?"
echo "$PERSON1:: I'm good, How is ur preparation for UEFA?"
echo "${PERSON2}:: Going good, hopefull to beat u this time"
echo "$PERSON1:: Good joke, we're Real Madrid - the kings of european football"