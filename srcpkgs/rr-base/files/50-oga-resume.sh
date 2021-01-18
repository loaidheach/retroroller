#!/bin/sh

alsactl restore -f /var/asound.state
modprobe -i esp8089 || true
modprobe -i dwc2
sv start ogage
