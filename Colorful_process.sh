#!/bin/bash

arr_symbols=('▷▷▷▷' '▶▶▶▶' '▷▷▷▷' '▶▶▶▶' '▷▷▷▷' '▶▶▶▶' '▷▷▷▷' '▶▶▶▶' '▷▷▷▷' '▶▶▶▶')
arr_foreground_colours=(107 40 107 40 107 40 107 40 107 40 107 40)
arr_background_colours=(30 97 30 97 30 97 30 97 30 97 30 97)
space=" "
index=0
for ((index_w=0; index_w < ${#arr_symbols[@]}; index_w++)); do
  abs=$(expr $index_w % 2)
  if [[ $abs == 0 ]]; then
    echo -en "\r$space\e[${arr_foreground_colours[index]}m\e[${arr_background_colours[index]}m ${arr_symbols[index_w]} \e[0m"
    sleep .5
  else
    echo -en "\r$space\e[${arr_foreground_colours[index]}m\e[${arr_background_colours[index]}m ${arr_symbols[index_w]} \e[0m"
    sleep .5
  fi
 space="$space      "
  let index=$index+1
done
