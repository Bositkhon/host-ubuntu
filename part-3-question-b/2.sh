#!/bin/bash
echo ENTER FILE NAME:
read fname

echo EXISTS:

if [ -e $fname ] 
  then
    echo YES
else 
    echo NO
fi

echo EMPTY:

if [ -s $fname ]
   then 	
     echo NO
else 
     echo YES
fi

echo file $fname is 

if [ -d $fname ]
   then 
    echo directory
fi

if [ -c $fname ]
   then
     echo character device file
fi  

if [ -f $fname ]
   then 
    echo smbolic link
fi           

if [ -p $fname ]
   then 
    echo named pipe 
fi

if [ -b $fname ]
   then 
    echo block special file
fi
        
if [ -r $fname ]
   then 
    echo readable
fi
if [ -w $fname ]
   then 
    echo writable 
fi
if [ -x $fname ]
   then 
    echo executable
fi
