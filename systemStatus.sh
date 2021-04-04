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
echo "---------------------------------------------------------------------------------------------------"

#CPU
echo -e "\nCPU Utilization\n----------------------"
echo "$(mpstat -u | tail -n 2)"

#Memory 
echo -e "\nDisk and Memory\n--------------------"
echo "$(free --human)"

#Disk 
echo -e "\n$(df -h | awk  'NR==1;$6=="/" || $6=="/home"')"
echo -e "\n$(iostat -dt | tail -n 5)"

#Network

#System Information
echo -e "\n---------------------------------------------------------------------------------------------------\n"


#Current top processes


echo -e "Network\n-------------------------"
#Network details
echo -e "$(iwgetid ) \n$(iwgetid -f)"
echo -e "\n$(ip -brief addr | grep "enps*\|eth[0-9]$\|wlan*")"

echo -e "$(vnstat -s -i enp3s0f1)"
echo -e "$(vnstat -s -i wlan0)"



echo -e "\n---------------------------------------------------------------------------------------------------\n"

echo -e "Packages (Pacman + AUR)\n---------------------------"
echo -e "\nTotal Packages : $(pacman -Qq | wc -l)\t Pacman: $(pacman -Qn | wc -l)\t AUR: $(pacman -Qm | wc -l)"

#Display no of packages to update
#Note: to check updates, pacman must syncrohize which requires root privileges.
if [[ $EUID -eq 0 ]]; then
    echo -e "$(pacman -Sy 2> /dev/null)"
else
    echo -e "\nPacman not synchronized. Must be run as root\n"
fi

echo -e "\nUpdates Available : "
echo -e "$(pacman -Qu)"


#Docker Containers
echo -e "\nDOCKER CONTAINERS\n-------------------------"
echo -e "$(docker ps -a --format "table{{.Names}}\t{{.Status}}\t{{.Ports}}\t{{.Size}}")"


