#!/bin/sh

modprobe -i esp8089
modprobe -i dwc2
alsactl restore -f /var/asound.state
sv start ogage
