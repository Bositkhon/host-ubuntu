#!/bin/bash
echo Enter a file name in your listdir
read FILE_NAME
echo Your file name is $FILE_NAME
LINE_NO=1
cat $FILE_NAME| while read line
do
	if [ $LINE_NO != 7 ]
	then 
		echo "$line"
	else
		echo "Hi, this new line has been inserted here"
	fi
	
	LINE_NO=$(expr $LINE_NO + 1)
done	
