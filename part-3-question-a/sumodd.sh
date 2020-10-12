#!/bin/bash

echo ==========================================
A=1
B=0
C=1

echo COMPUTING SUM OF FIRST N ODD INTEGERS
echo ENTER VALUE OF N= 
read n
while [$A -le $n] do
  B=$(expr $B + $C)
  A=$(expr $A + 1)
  C=$(expr $C + 2)
done

echo SUM OF FIRST $n ODD NUMBERS = $B
