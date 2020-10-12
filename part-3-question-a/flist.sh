#!/bin/bash

echo ==========================================
echo DO YOU WANT DIRECTORY LISTING LONG OR SHORT \(ENTER 1 OR 0\)
read LONG
if [ $LONG -eq 1 ] then
  ls -la
else
  ls
fi
