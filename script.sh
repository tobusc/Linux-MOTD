
echo ' _       __         ______             __         
| |     / /___     /_  __/___   _____ / /_   _____
| | /| / // _ \     / /  / _ \ / ___// __ \ / ___/
| |/ |/ //  __/    / /  /  __// /__ / / / /(__  ) 
|__/|__/ \___/    /_/   \___/ \___//_/ /_//____/  
' > /etc/motd
rm /etc/profile.d/sshpwd.sh > /dev/null 2>&1
echo '#!/bin/bash
let actividad="$(/usr/bin/cut -d. -f1 /proc/uptime)"
let seg=$((${actividad}%60))
let mins=$((${actividad}/60%60))
let horas=$((${actividad}/3600%24))
let dias=$((${actividad}/86400))
uptime=`printf "%d dias, %02dh%02dm%02ds" "$dias" "$horas" "$mins" "$seg"`
echo Uptime: $uptime
weid=$(cat /root/modbus/weid.txt)
echo We ID: $weid
serial=$(cat /proc/cpuinfo | grep Serial | cut -d " " -f 2)
echo Serial: $serial
' > /etc/update-motd.d/10-uname
