# KarotzFiles
Some files for your Karotz.

---

### tts1:
This is a replacement for the original TTS file from OpenKarotz, since Acapela doesn't support their TTS anymore. This file uses TTS from VoiceRSS.org (see also comment). Place the contents of this file in /www/cgi-bin/tts of your Karotz running OpenKarotz (overwrite the contents of the current file). Give it execute permission (`chmod 755`). If it doesn't work, try `dos2unix tts`.

---

### tts2:
This is another replacement for the original TTS file from OpenKarotz, since Acapela doesn't support their TTS anymore. This file uses TTS from ResponsiveVoice.org (see also comment). Place the contents of this file in /www/cgi-bin/tts of your Karotz running OpenKarotz (overwrite the contents of the current file). Give it execute permission (`chmod 755`). If it doesn't work, try `dos2unix tts`.

---

### tts3:
This is again another replacement for the original TTS file from OpenKarotz, since Acapela doesn't support their TTS anymore. This file uses a service from ISpeech. All of the work is done by MikeyLife (karotz.mikey-life.com), and since December 2016, this TTS is also offered as patch in OpenKarotz. Place the contents of this file in /www/cgi-bin/tts of your Karotz running OpenKarotz (overwrite the contents of the current file). Give it execute permission (`chmod 755`). If it doesn't work, try `dos2unix tts`.
You will also have to update the file "voice_list" in /www/cgi-bin, see this repo for a replacement.

---

### voice_list:
This files belongs to tts3 and has to be saved in /www/cgi-bin, together with tts3 (which has to be saved as /www/cgi-bin/tts).

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
