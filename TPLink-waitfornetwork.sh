#!/bin/bash
# Free Rabbits Networking Script to connect using WIFI with the TPLink TL-WN725N adapter.
# Put the network driver (8188eu.ko) in /usr/karotz/firmware/.
# Put this script in /usr/scripts as 'waitfornetwork.sh' (overwrite original file).
# Change the settings in the first 6 lines below.

IP="your-static-ip"
DNS="your-dns-ip-address-or-8.8.8.8"
GW="your-gateway-ip-address"
NM="your-netmask-or-255.255.255.0"
SSID="your-network-name-ssid"
PWD="your-wireless-password"

# load the driver into the kernel using insmod. 
# the driver for TPLink is 8188eu.ko and should be in directory /usr/karotz/firmware/
/sbin/insmod /usr/karotz/firmware/8188eu.ko

# write DNS resolver 
echo -e "nameserver ${DNS}" >/etc/resolv.conf

# write WPA.CONF
echo -e "network={\nssid=\"${SSID}\"\npsk=\"${PWD}\"\nkey_mgmt=WPA-PSK\nscan_ssid=1\nproto=WPA RSN\n}" >/usr/etc/conf/wpa.conf

# bring network interfaces up
/sbin/ifconfig lo up
/sbin/ifconfig wlan1 up

# assign IP address and netmask
/sbin/ifconfig wlan1 ${IP} netmask ${NM}

# add route to gateway
/sbin/route add default gw ${GW}

# start WLAN
/usr/sbin/wpa_supplicant -iwlan1 -Dwext -B -c/usr/etc/conf/wpa.conf

# try to ping to Googles public DNS
for i in {1..5}; do ping -q -c1 8.8.8.8 >/dev/null 2>&1 && break; done

exit
