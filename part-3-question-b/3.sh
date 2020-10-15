#!/bin/bash
echo Enter size of the list:
read N
echo Enter the elements in the list:
let K=0
while [ $K -lt $N ]
do
	read VAL
	list[$K]=$VAL
	let K=$K+1
done

#Maximum element
let I=1
max=${list[0]}
while [ $I -lt $N ]
do
	if [ ${list[$I]} -gt $max ]
		then 
		max=${list[$I]}
	fi
		let I=$I+1
done
echo Maximum element in the list: $max

#Minimum element
let I=1
min=${list[0]}
while [ $I -lt $N ]
do
	if [ ${list[$I]} -lt $min ]
		then 
		min=${list[$I]}
	fi
		let I=$I+1
done
echo Minimum element in the list: $min

#Equal element
echo Enter the element you want to find:
read key
let I=0
msg="NOT FOUND"
while [ $I -lt $N ]
do
	if [ ${list[$I]} -eq $key ]
		then 
		msg="KEY FOUND"
	fi
		let I=$I+1
done
echo $msg




	
