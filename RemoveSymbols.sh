#!/bin/bash

echo -en "Write unnecessary symbols: "
read symbols

if [[ -n $symbols ]] ; then
	echo -en "Chose how put text: file or input text (f)/(t): "
	read info

	symbols_arr=$(echo "$symbols" | sed 's/\S/& /g')

	case $info in
		f)
echo -en "Enter full path: "
read dir
if [[ -n $dir ]] && ! [[ $dir =~ "random" ]]; then
	text=$(cat $dir)
	for i in ${symbols_arr[@]} ; do
		text=$(echo $text | sed -E "s/[$i]//g") 
	done
	echo "$text"
else
	echo "File not found"
fi
;;
t)
echo -en "Enter text: "
read input_text
if [[ -n $input_text ]]; then
	for i in ${symbols_arr[@]} ; do
		input_text=$(echo $input_text | sed -E "s/[$i]//g") 
	done
else
	echo -n "Got an empty string"
fi
echo "$input_text"
;;
*)
echo "Nothing selected"
esac
else
	echo "Got an empty string"	
fi
