#!/bin/bash
echo ==========================================
echo ENTER A FILE NAME TO STORE 10 NAMES
read FILE
echo ENTER 10 NAMES ONE BELOW THE OTHER ON SEPARATE LINE AND THEN PRESS ^d
cat >> $FILE
echo PRESS Enter KEY
read key
echo ==========================================
echo YOUR FILE $FILE CONTENTS
cat $FILE
echo PRESS Enter KEY
read key
echo ==========================================
echo FILE SORTING IN ALPHABETICAL ORDER
sort $FILE
echo PRESS ENTER KEY
read key
echo ==========================================
echo FILE SORTING IN REVERSE ALPHABETICAL ORDER
sort -r $FILE
