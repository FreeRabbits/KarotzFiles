#!/usr/bin/python

# Play a radio station by URL
# 2017 - FreeRabbits.nl

import cgi
import os
import sys
import urllib
import simplejson as json

def RunCommand(cmd):
    return os.system(cmd)

def IsSleeping():
    return os.path.isfile("/tmp/karotz.sleep") or os.path.isfile("/usr/openkarotz/Run/karotz.sleep")

def PlayRadio(url):
    cmd = "killall mplayer >/dev/null 2>&1; /usr/bin/mplayer -quiet " + url + " >/dev/null 2>&1 &"
    return os.system(cmd)

# Main program
url = ""
msg = ""
result = 1
fields = cgi.FieldStorage()

if "url" in fields:
    url = fields["url"].value
    if not IsSleeping():
        result = PlayRadio(url)
    else:
        msg = "Rabbit is sleeping"
else:
    msg = "No URL passed"

# Create the JSON object
data = {}
data["return"] = (result == 0)
data["played"] = (result == 0)
data["url"] = url
data["message"] = msg

# Write Output Response
print "Server: OpenKarotz WebServer 1.0"
print "Connection: close"
print "Accept-Ranges: bytes"
print "Content-type: text/plain"
print "Access-Control-Allow-Origin: *"
print
print json.dumps(data)

