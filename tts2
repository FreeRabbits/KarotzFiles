#!/usr/bin/python

# Text To Speech with Python, powered by Responsive Voice.
# For more information, see https://responsivevoice.org/
# Save this file as "tts" in /www/cgi-bin, and delete tts.inc.
# 2016 - FreeRabbits.nl

import cgi
import os
import sys
import urllib
import md5
import simplejson as json

def RunCommand(cmd):
    return os.system(cmd)

def IsSleeping():
    return os.path.isfile("/tmp/karotz.sleep") or os.path.isfile("/usr/openkarotz/Run/karotz.sleep")

def Language(voice):
    lang = "fr-fr"
    if voice in "[lucy][graham]":
        lang = "en-gb"
    if voice in "[heather][ryan]":
        lang = "en-us"
    if voice in "[andreas][julia]":
        lang = "de-de"
    if voice in "[chiara][vittorio]":
        lang = "it-it"
    if voice in "[femke][daan][jasmijn][zoe]":
        lang = "nl-nl"
    return lang

def PlayMP3(mp3file):
    if not IsSleeping():
        cmd = "/usr/bin/madplay -A6 " + mp3file + " >/dev/null 2>&1"
        return os.system(cmd)

# Main program
md5Hash = ""
voice = ""
result = 1
cached = False
fields = cgi.FieldStorage()

if "voice" in fields and "text" in fields:
    voice = fields["voice"].value.lower()
    text = fields["text"].value
    md5Hash = md5.new(voice + text).hexdigest()
    mp3FileName = "/tmp/" + md5Hash + ".mp3"
    cached = os.path.isfile(mp3FileName)
    if not cached:
        params = urllib.urlencode({"t": text, "tl": Language(voice)})
        baseUrl = "http://responsivevoice.org/responsivevoice/getvoice.php"
        cmd = "wget -q -O %(mp3)s \"%(url)s?%(params)s\"" % { "mp3": mp3FileName, "url": baseUrl, "params": params }
        result = RunCommand(cmd)
    if os.path.isfile(mp3FileName):
        result = PlayMP3(mp3FileName)

# Create the JSON object
data = {}
data["return"] = (result == 0)
data["id"] = md5Hash
data["played"] = (result == 0)
data["cache"] = cached
data["voice"] = voice

# Write Output Response
print "Server: OpenKarotz WebServer 1.0"
print "Connection: close"
print "Accept-Ranges: bytes"
print "Content-type: text/plain"
print "Access-Control-Allow-Origin: *"
print
print json.dumps(data)
