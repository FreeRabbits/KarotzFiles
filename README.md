# KarotzFiles
Some files for your Karotz.

tts:
This is an improved version of the tts file. It doesn't depend on tts.inc anymore. Some optimization and formatting, removed duplicate code. Place this file in the /www/cgi-bin folder of your Karotz running OpenKarotz. Give it execute permission (chmod 755). If it doesn't work, try dos2unix tts

autorun-firmware-original:
Original autorun file from a USB key with firmware version 12.07.19.00

waitfornetwork.sh:
Shell script to start the WIFI of a Karotz. This could be a replacement for the "wait_until_connected.py" Python script when you don't want to use the default Karotz scripts.

startup.sh
Alternative startup script to start network (by calling waitfornetwork.sh). When successful, start other processes (like the Imortaldog deamon).
