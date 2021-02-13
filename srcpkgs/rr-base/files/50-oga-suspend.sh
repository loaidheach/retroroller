#!/bin/sh

#alsactl store
sv stop ogage

modprobe -r dwc2
lsmod | tail -n+2 | cut -d' ' -f1 > /tmp/zzz_modules
for x in $(cat /tmp/zzz_modules); do
    modprobe -r $x || true
done
