#!/bin/bash
#Menu Driven program to perform listed operations
loop=1
while [ $loop -eq 1 ]
do
  echo ...............................................
  echo .                   MENU                      .
  echo .                                             .
  echo . 1. LIST DIRECTORY CONTENTS                  .
  echo . 2. SHOW CURRENT WORKING DIRECTORY           .
  echo . 3. DISPLAY LINUX VERSION                    .
  echo . 4. SHOW FREE SPACE ON DISK                  .
  echo . 5. SHOW WHO ARE LOGGED IN                   .
  echo . 6. DISPLAY CONTENTS OF A FILE               .
  echo . 7.CREATE OR OPEN A FILE                     .
  echo . 8.COPY A FILE                               .
  echo . 9.RENAME A FILE                             .
  echo . 10.REMOVE A FILE                            .
  echo . 11.QUIT                                     .
  echo ...............................................
  echo ENTER YOUR CHOICE:
  read CH
  case $CH in
  1)
    ls
    ;;
  2)
    pwd
    ;;
  3)
    uname -r
    ;;
  4)
    free
    ;;
  5)
    who -a
    ;;
  6)
    echo ENTER FILE NAME:
    read FILE
    cat $FILE
    ;;
  7)
    echo ENTER FILE NAME:
    read FILE
    gedit $FILE  
    ;;
  8)
    echo ENTER NAME OF THE FILE TO BE COPIED FROM:
    read FILE1
    echo ENTER NAME OF THE FILE TO BE COPIED TO:
    read FILE2
    cp $FILE1 $FILE2
    ;;
  9)
    echo ENTER OLD FILE NAME:
    read FILE1
    echo ENTER NEW FILE NAME:
    read FILE2
    mv $FILE1 $FILE2
    ;;
  10)
    echo ENTER NAME OF THE FILE TO DELETE:
    read FILE
    echo ARE YOU SURE - CONFIRM 1 OR 0 read OK
    if [ $OK -eq 1 ]
    then
    rm $FILE
    echo FILE $FILE DELETED.....OK
    else
     echo FILE $FILE NOT DELETED.....OK
    fi
    ;;
  11)
    echo QUITTING....GOOD BYE
    break;
    ;;
  *)
    echo INVALID CHOICE - READ MENU CORRECTLY
    ;;
  esac
done
