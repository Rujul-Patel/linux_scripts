#!/bin/bash
#A script to alert the user, if the system is critically low on any resource

while true
do


    #Flag to indicate if anything critical has happened
    criticalAlert=0
    msg="
    "


    #If less than 10% of RAM is available
    ramTotal="$(free -m | tail -n 2 | head -n 1 | awk '{ print $2 }')"
    ramFree="$(free -m | tail -n 2 | head -n 1 | awk '{ print $7 }')"
    ramThreshold=400

    if [ "$ramFree" -le "$ramThreshold" ]
    then
            
msg="
${msg}

Memory running low, ${ramFree} MB Available
"

        criticalAlert=1

    fi









    if [ "$criticalAlert" -eq 1 ]
    then
        DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus /usr/bin/notify-send.py --urgency=critical  "${msg}"
        #echo "Critical Usage Detected! Sleeping"
        sleep 5m
    else
        #echo "Normal Usage!!!"
        sleep 10s
    fi

done
    
