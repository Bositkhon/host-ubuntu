#!/bin/bash
echo FILES IN YOUR HOME DIRECTORY WITH EXTENSION .c
for FILE in $HOME/*.c
do
  echo $FILE
done
