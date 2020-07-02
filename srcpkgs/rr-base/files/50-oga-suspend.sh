#!/bin/sh

alsactl store -f /var/asound.state
sv stop ogage
modprobe -r dwc2
if [ $(grep v11 /sys/devices/platform/odroidgo2-joypad/input/input2/name) ]; then
    modprobe -r esp8089
fi
