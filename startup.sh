#!/bin/bash

function led_cyan_pulse {
    /bin/killall led >/dev/null
    /karotz/bin/led -l 00FFFF -p 000000 -d 400 &
}

function led_green {
    /bin/killall led >/dev/null
    /karotz/bin/led -l 00FF00
}

function led_red {
    /bin/killall led >/dev/null
    /karotz/bin/led -l FF0000
}

function dbus_led_green_pulse {
    dbus-send --system --dest=com.mindscape.karotz.Led /com/mindscape/karotz/Led com.mindscape.karotz.KarotzInterface.pulse string:"" string:"00FF00" string:"000000" int32:700 int32:-1
}

function play_ready {
    /usr/bin/madplay /usr/karotz/FreeRabbits/Sounds/ready.mp3
}

function dbus_start {
    [ -f /var/run/messagebus.pid ] && rm /var/run/messagebus.pid
    logger -s "[STARTUP] Starting dbus"
    /etc/init.d/S30dbus start >/dev/null
    logger -s "[STARTUP] dbus started"
}

function sync_time {
    logger -s "[STARTUP] Sync time with pool.ntp.org"
    /bin/busybox ntpd -q -p pool.ntp.org
}

function start_cron {
    logger -s "[STARTUP] Start CRON scheduler"
    /sbin/crond -c /usr/spool/cron/crontabs
}

function start_bricks {
    logger -s "[STARTUP] Start Immortaldog bricks"
    /usr/karotz/bin/immortaldog /var/run/karotz/led.pid /usr/karotz/bin/led-daemon >/dev/null 2>/dev/null
    /usr/karotz/bin/immortaldog /var/run/karotz/rfid.pid /usr/karotz/bin/rfid-daemon >/dev/null 2>/dev/null
    /usr/karotz/bin/immortaldog /var/run/karotz/webcam.pid /usr/karotz/bin/webcam-daemon >/dev/null 2>/dev/null
    /usr/karotz/bin/immortaldog /var/run/karotz/button.pid /usr/karotz/bin/button-daemon >/dev/null 2>/dev/null
    /usr/karotz/bin/immortaldog /var/run/karotz/dbus_watcher.pid /usr/karotz/dbus_watcher >/dev/null 2>/dev/null
}

logger -s "[STARTUP] Starting Startup script"

led_cyan_pulse
/usr/waitfornetwork.sh >/dev/null

if [ $? -eq 0 ]; then
    logger "[STARTUP] Karotz connected to internet"
    led_green
    dbus_start
    sync_time
    start_cron
    /bin/killall led >/dev/null
    start_bricks
    sleep 3
    dbus_led_green_pulse
    play_ready
else
    logger "[STARTUP] Karotz not connected to internet"
    led_red    
fi

logger "[STARTUP] Startup script finished"
