#!/bin/bash
#Script to display 'Detailed System Information'.
#-----------------------------------------------------------------------------
#
#   1. System status
#       - Datetime, uptime, users and login details
#       - Main memory utilization, CPU utilization
#           - Top 5 processes by memory, cpu usage
#       - Disk utilization
#       - Network 
#           - Ethernet and wireless status
#           - Ip addresses
#           - Utilization
#   2. Packages
#       - No of packages, (afetch/neofetch)
#       - Updates pending
#   3. Docker
#       - Running, paused containers
#       - Disk utilization by images, volumes, etc.
#
#----------------------------------------------------------------------------- 




#Basic system info
echo "$(clear)"
echo  -e "$(whoami)@$(hostname)  $(uname -rs)"
echo -e "$(date) \t $(uptime -p)"

#System Utilization Details
echo "------------------------------------------------------------------------------------------------------"

#CPU
echo -e "\n-----CPU Utilization-----"
echo "$(mpstat -u | tail -n 2)"

#Memory 
echo -e "\n-----Disk and Memory-----"
echo "$(free --human)"

#Disk 
echo -e "\n$(df -h | awk  'NR==1;$6=="/" || $6=="/home"')"
echo -e "\n$(iostat -dt | tail -n 5)"

#Network

#System Information
echo "------------------------------------------------------------------------------------------------------"

#Current top processes
    




exit






echo "Welcome, $(whoami)."

#####   GENERAL SYSTEM INFORMATION ####
#Kernel version
echo "OS: $(uname -sr)"

#Disk Usage
echo -e "\nDISK USAGE \n********************"

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
