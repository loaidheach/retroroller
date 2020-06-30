#!/bin/sh

alsactl restore -f /var/asound.state
modprobe -i esp8089
modprobe -i dwc2
sv start ogage
