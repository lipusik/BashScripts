#!/bin/bash

echo -en "Write your first array: "
read arr1
echo -en "Write your second array: "
read arr2

uniq_values=$(echo ${arr1[@]} ${arr2[@]} | tr ' ' '\n' | sort | uniq -u | tr '\n' ', ')
ununiq_values=$(echo ${arr1[@]} ${arr2[@]} | tr ' ' '\n' | sort -nr | uniq -dc | cut -d " " -f 7,8 | sed "s/ / - /")

if [[ -n $uniq_values ]]; then
echo -e "\n\033[1;32mUniq values: \033[0m$uniq_values"
else
	echo -e "\n\033[1mUnique values not found\033[0m"
fi
if [[ -n $ununiq_values ]]; then
echo -e "\033[1;31mUnuniq values: \033[0m\n$ununiq_values"
else
	echo -e "\n\033[1mUnunique values not found\033[0m"
fi