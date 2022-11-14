#!/bin/bash

arr_symbols=('▷▷▷▷' '▶▶▶▶')
arr_foreground_colours=(107 40 107 40 107 40 107 40 107 40 107 40)
arr_background_colours=(30 97 30 97 30 97 30 97 30 97 30 97)

space=" "
index=0
for ((index=0; index < ${#arr_foreground_colours[@]}; index++)); do
  for symbol in ${arr_symbols[@]}; do
    if [[ $symbol == "${arr_symbols[0]}" ]]; then
      echo -en "\r$space\e[${arr_foreground_colours[index]}m\e[${arr_background_colours[index]}m $symbol \e[0m"
      sleep .5
    else
      echo -en "\r$space\e[${arr_foreground_colours[index+1]}m\e[${arr_background_colours[index+1]}m $symbol \e[0m"
      sleep .5
    fi
    space="$space      "
  done
  let index=$index+1
done