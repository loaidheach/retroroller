#!/bin/sh

RM="/etc/runit/runsvdir/default/agetty-tty1
/etc/runit/runsvdir/default/agetty-tty3
/etc/runit/runsvdir/default/agetty-tty4
/etc/runit/runsvdir/default/agetty-tty5
/etc/runit/runsvdir/default/agetty-tty6
/etc/runit/runsvdir/default/dhcpcd
/usr/libexec/dhcpcd-hooks/10-wpa_supplicant
/boot/wpa_supplicant.conf
 "

for f in $RM; do
    if [ -e $f ]; then
        rm -f $f
    fi
done

if [ ! -e /etc/runit/runsvdir/default/dbus ]; then
    ln -sf /etc/sv/dbus /etc/runit/runsvdir/default/
fi

if [ ! -e /etc/runit/runsvdir/default/NetworkManager ]; then
    ln -sf /etc/sv/NetworkManager /etc/runit/runsvdir/default/
fi

if ! groups odroid | grep -q '\bnetwork\b'; then
    gpasswd -a odroid network
fi

echo 0 > /proc/sys/kernel/nmi_watchdog
echo 1500 > /proc/sys/vm/dirty_writeback_centisecs
#echo disabled > /sys/class/net/wlan0/device/power/wakeup

chgrp adm /sys/devices/platform/ff400000.gpu/devfreq/ff400000.gpu/governor
chmod 775 /sys/devices/platform/ff400000.gpu/devfreq/ff400000.gpu/governor

chgrp adm /sys/devices/platform/dmc/devfreq/dmc/governor
chmod 775 /sys/devices/platform/dmc/devfreq/dmc/governor

chgrp adm /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
chmod 775 /sys/devices/system/cpu/cpufreq/policy0/scaling_governor

echo mmc0 > /sys/class/leds/blue:heartbeat/trigger

/usr/bin/iw dev wlan0 set power_save off

