#!/bin/bash
## To be executed in the directory where the new files to rename are located

## Gets the path of the cloned directory from the user
# read -p "Cloned directory: " dir

# Standard directory is ./Wallpapers/
dir="./Wallpapers"

## Finds all the files in the cloned directory | prints all the MIME types and reads the filenames from the stdin | grep | returns the first column | counts occurences ## 
a=$(find ${dir} -print | file -if - | grep "image" | awk -F: '{print $1}' | wc -l)
a=$((a+1))

## Each file in the current working directory that has the MIME type "image" gets renamed to include the current Month and Year and a progressive number ## 
for i in $(ls . | file -if - | grep "image" | awk -F: '{print $1}'); do	
  num=$(printf "%04d" "$a") #04 pad to length of 4
  dat=$(date +%b%Y)
  mv -i -- "$i" "${dat}_${num}" # the -i flag requires the user to confim dangerous operations (overwriting)
  let a=a+1
done
