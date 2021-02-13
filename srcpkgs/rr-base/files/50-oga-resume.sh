#!/bin/sh

#alsactl restore
sv start ogage

#modprobe -i dwc2
for x in $(cat /tmp/zzz_modules); do
    modprobe -i $x || true
done
