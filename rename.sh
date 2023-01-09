#!/bin/bash

a=1
for i in $( ls ); do	
  num=$(printf "%04d" "$a") #04 pad to length of 4
  dat=$(date +%b%Y)
  mv -i -- "$i" "${dat}_${num}" 
  let a=a+1
done
