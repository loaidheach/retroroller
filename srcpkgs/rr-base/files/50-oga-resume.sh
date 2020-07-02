#!/bin/sh

alsactl restore -f /var/asound.state
if [ $(grep v11 /sys/devices/platform/odroidgo2-joypad/input/input2/name) ]; then
    modprobe -i esp8089
fi
modprobe -i dwc2
sv start ogage
