#!/bin/sh

alsactl store -f /var/asound.state
sv stop ogage
modprobe -r dwc2
modprobe -r esp8089 || true
