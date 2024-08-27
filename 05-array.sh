#!/bin/bash

fruits=("apple" "mango" "kiwi")

echo "1st fruit: $fruits[0]"
echo "2nd fruit: ${fruits[1]}"
echo "3rd fruit: ${fruits[2]}"

echo "all fruits: ${fruits[@]}"