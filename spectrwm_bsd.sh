#!/bin/sh
# spectrwm_baraction.sh script for spectrwm status bar

SLEEP_SEC=10  # set bar_delay = 5 in /etc/spectrwm.conf

#loops forever outputting a line every SLEEP_SEC secs
while :; do
# Volume script:
    vol=$(mixer | awk 'NR==1{print substr ($7,1,3)}');if [ $vol != 100 ];then pcm="MUTE";else pcm=$(mixer | awk 'NR==2{print substr($7,1,2)"%"}');fi
# Ethernet
    eth=$(ethernet=$(ifconfig | awk 'NR==5{print $2}'); if [ $ethernet = "active" ]; then echo "Eth: UP | "; else printf ""; fi)
# ESSID script:
    ssid=$(ifconfig | awk '/ssid/ {print $2}')
# Battery percent script:
    batp0=$(acpiconf -i 0 | awk '/Remaining capacity/ {print $3}')
    batp1=$(acpiconf -i 1 | awk '/Remaining capacity/ {print $3}')

        echo -e "$eth Wifi:$ssid | Vol:$pcm | Bat0:$batp0 1:$batp1"
        sleep $SLEEP_SEC
done
