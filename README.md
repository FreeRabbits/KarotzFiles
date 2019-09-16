# KarotzFiles
Some files for your Karotz.
If you want to say hello to me, visit www.freerabbits.nl and send me a message using the contact-page.

---

### TPLink-waitfornetwork.sh:
This is a replacement for the 'waitfornetwork.sh' file from FROS. You can use this network script when you own a TPLink TL-WN725N Wireless N Nano USB Adapter. Use this adapter with your Karotz. Put the network driver (8188eu.ko) in /usr/karotz/firmware/. Put this script in /usr/scripts as 'waitfornetwork.sh' (overwrite original file). Change the settings in the first 6 lines below the comments.

---

### tts1:
This is a replacement for the original TTS file from OpenKarotz, since Acapela doesn't support their TTS anymore. This file uses TTS from VoiceRSS.org (see also comment). Place the contents of this file in /www/cgi-bin/tts of your Karotz running OpenKarotz (overwrite the contents of the current file). Give it execute permission (`chmod 755`). If it doesn't work, try `dos2unix tts`.

---

### tts2:
This is another replacement for the original TTS file from OpenKarotz, since Acapela doesn't support their TTS anymore. This file uses TTS from ResponsiveVoice.org (see also comment). Place the contents of this file in /www/cgi-bin/tts of your Karotz running OpenKarotz (overwrite the contents of the current file). Give it execute permission (`chmod 755`). If it doesn't work, try `dos2unix tts`.

---

### tts3:
This is again another replacement for the original TTS file from OpenKarotz, since Acapela doesn't support their TTS anymore. This file uses a service from ISpeech. All of the work is done by MikeyLife (karotz.mikey-life.com), and since December 2016, this TTS is also offered as patch in OpenKarotz. Place the contents of this file in /www/cgi-bin/tts of your Karotz running OpenKarotz (overwrite the contents of the current file). Give it execute permission (`chmod 755`). If it doesn't work, try `dos2unix tts`.
ISpeech doesn't work anymore since September 2019 (returning message 'result=error&code=3&message=Not+enough+credits'), see TTS4 for a replacement.

---

### tts4:
This is again another replacement for the original TTS file from OpenKarotz, since Acapela and ISpeech don't support their TTS anymore. This file uses the service from ResponsiveVoice. Based on TTS3 and info from karotz.mikey-life.com. Since September 2019, this TTS is also offered as the TTS engine by OpenKarotz. Place the contents of this file in /www/cgi-bin/tts of your Karotz running OpenKarotz (overwrite the contents of the current file). Give it execute permission (`chmod 755`). If it doesn't work, try `dos2unix tts`.
You will also have to update the file "voice_list" in /www/cgi-bin, see this repo for a replacement.

---

### voice_list:
This files belongs to tts4 and has to be saved in /www/cgi-bin, together with tts4 (which has to be saved as /www/cgi-bin/tts).

---

### autorun-firmware-original:
Original autorun file from a USB key with firmware version 12.07.19.00

---

### waitfornetwork.sh:
Shell script to start the WIFI of a Karotz. This could be a replacement for the "wait_until_connected.py" Python script when you don't want to use the default Karotz scripts.

---

### startup.sh
Alternative startup script to start network (by calling waitfornetwork.sh). When successful, start other processes (like the Imortaldog deamon).

---

### PlayRadio.py
Python script to play a internet radio station by URL. You can use this as a replacement for the bash script files from OpenKarotz. If you want to do this, replace the javascript to call this file. Don't forget: give it execute permission (`chmod 755`).

---

### stopsound
Bash script to stop all sound processes. You can place this file in the /www/cgi-bin directory.

---
