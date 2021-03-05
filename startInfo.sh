#!/bin/bash
#A shell script for printing information at startup

# 
echo "Welcome, $(whoami)."

#####   GENERAL SYSTEM INFORMATION ####
#Kernel version
echo "OS: $(uname -sr)"

#Disk Usage
echo -e "\nDISK USAGE \n********************"
echo -e "$(df -h | awk  'NR==1;$6=="/" || $6=="/home"')"

#Network Details
echo -e "\nNETWORK \n********************"

#Wifi
echo -e "$(iwgetid ) \n$(iwgetid -f)"

#IP 
echo -e "\n$(ip -brief addr | grep "enps*\|eth[0-9]$\|wlan*")"

#Docker Containers
echo -e "\nDOCKER CONTAINERS\n********************"
echo -e "$(docker ps -a --format "table{{.Names}}\t{{.Status}}\t{{.Ports}}\t{{.Size}}")"



#Weather
echo -e "\nWEATHER FORECAST\n********************"
echo -e "$( curl -s wttr.in  | head -n 17 | tail -n 10)"


#test
