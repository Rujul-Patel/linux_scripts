#!/usr/bin/env bash

#Wifi - lan settings




#Memory Info
ramUsed="$(free -mh | tail -n 2 | head -n 1 | awk '{ print $3 }')"
ramAvail="$(free -mh | tail -n 2 | head -n 1 | awk '{ print $7 }')"
swapUsed="$(free -mh | tail -n 1 | awk '{ print $3 }')"
swapAvail="$(free -mh | tail -n 1| awk '{ print $4 }')"

#Disk Usage
ssdUsed="$(df -h | grep sda6 | awk '{print "SSD \t" $3 "\t " $4   }')"
hddUsed="$(df -h | grep sdb2 | awk '{print "HDD \t" $3 "\t " $4   }')"
#ssdUsed="$(df -h)"


date=$(date +"%A, %d-%b-%C ")
time=$(date +"%I:%M %p")

msg="
${date} , ${time}


\tUsed\t Avail
RAM \t${ramUsed} \t ${ramAvail} 
Swap \t${swapUsed} \t ${swapAvail}  

$ssdUsed
$hddUsed


"

DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus /usr/bin/notify-send.py "${msg}"
