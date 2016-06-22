#!/bin/bash

IP="[ip]"
DNS="[dns]"
GW="[gw]"
NM="[nm]"
SSID="[ssid]"
PWD="[pwd]"

# write DNS resolver 
echo -e "nameserver ${DNS}" >/etc/resolv.conf

# write WPA.CONF
echo -e "network={\nssid=\"${SSID}\"\npsk=\"${PWD}\"\nkey_mgmt=WPA-PSK\nscan_ssid=1\nproto=WPA RSN\n}" >/usr/etc/conf/wpa.conf

# bring network interfaces up
/sbin/ifconfig lo up
/sbin/ifconfig wlan0 up

# assign IP address and netmask
/sbin/ifconfig wlan0 ${IP} netmask ${NM}

# add route to gateway
/sbin/route add default gw ${GW}

# start WLAN
/usr/sbin/wpa_supplicant -iwlan0 -Dwext -B -c/usr/etc/conf/wpa.conf

# try to connect to Googles public DNS
for i in {1..10}; do /bin/nc -w5 8.8.8.8:53 >/dev/null 2>/dev/null && break; done

exit
