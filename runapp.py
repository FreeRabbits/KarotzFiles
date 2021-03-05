#!/usr/bin/python

# Run a Timebutton app using the web interface of OpenKarotz
# Pass the queryparameter 'appid' with a valid numeric id in the url.
# Example call: http://192.168.1.100/cgi-bin/runapp.py?appid=3002
# This will run the 'random sound app' on a Karotz with IP 192.168.1.100
# 2021 - FreeRabbits.nl

import cgi
import os
import subprocess
import sys
import urllib
import simplejson as json

def RunApp(appid):
    subprocess.Popen(["python", "/usr/karotz/FreeRabbits/commander.py", appid], stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    return 0

def IsSleeping():
    return os.path.isfile("/tmp/karotz.sleep") or os.path.isfile("/usr/openkarotz/Run/karotz.sleep")

# Main program
appid = ""
msg = ""
result = 1
fields = cgi.FieldStorage()

if "appid" in fields:
    appid = fields["appid"].value
    if not IsSleeping():
        msg = "App to run: " + appid
        result = RunApp(appid)
    else:
        msg = "Rabbit is sleeping"
else:
    msg = "No appid passed"

# Create the JSON object
data = {}
data["return"] = (result == 0)
data["appid"] = appid
data["message"] = msg

# Write Output Response
print "Server: OpenKarotz WebServer 1.0"
print "Connection: close"
print "Accept-Ranges: bytes"
print "Content-type: text/plain"
print "Access-Control-Allow-Origin: *"
print
print json.dumps(data)