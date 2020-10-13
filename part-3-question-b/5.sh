#!/bin/bash
#Menu Driven program to perform listed operations
loop=1
while [ $loop -eq 1 ]
do
echo ...............................................................................................
echo . MENU .
echo . .
echo . 1. HALT - Brings the system down immediately
echo . 2. init 0 - Powers off the system using predefined scripts to synchronize and clean up the system pror to shutting down
echo . 3. init 6 - Reboots the system by shutting it down completely \then restarting it
echo . 4. Poweroff - Shuts down the system by powering off
echo . 5. Reboot - Reboots the system
echo . 6. Shutdown - Shuts down the system
echo . 7. QUIT 
echo ................................................................................................
echo ENTER YOUR CHOICE :
read CH
case $CH in
1)
halt
;;
2)
init 0
;;
3)
init 6
;;
4)
poweroff
;;
5)
reboot
;;
6)
shutdown
;;
7)
echo QUITING.......GOOD BYE
break
;;
*)
echo INVALID CHOICE - READ MENU CORRECTLY
;;
esac
done
