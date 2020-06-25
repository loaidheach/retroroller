#!/bin/sh

sv stop ogage
alsactl store -f /var/asound.state
modprobe -r dwc2
modprobe -r esp8089
