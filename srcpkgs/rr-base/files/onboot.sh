#!/usr/bin/env bash

if [ -f /boot/rrvl.conf ]; then
	source /boot/rrvl.conf
fi

RM="/etc/runit/runsvdir/default/agetty-tty1
/etc/runit/runsvdir/default/agetty-tty2
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

for f in /sys/devices/platform/ff400000.gpu/devfreq/ff400000.gpu/governor /sys/devices/platform/dmc/devfreq/dmc/governor /sys/devices/system/cpu/cpufreq/policy0/*; do
	chgrp adm $f
	chmod 775 $f
done

chmod 777 /dev/tty2

if [ ! -e /etc/runit/runsvdir/default/dbus ]; then
    ln -sf /etc/sv/dbus /etc/runit/runsvdir/default/
fi

if [ ! -e /etc/runit/runsvdir/default/agetty-tty3 ]; then
    ln -sf /etc/sv/agetty-tty3 /etc/runit/runsvdir/default/
fi

if [ ! -e /etc/runit/runsvdir/default/agetty-console ]; then
    ln -sf /etc/sv/agetty-console /etc/runit/runsvdir/default/
fi

if [ ! -e /etc/runit/runsvdir/default/NetworkManager ]; then
    ln -sf /etc/sv/NetworkManager /etc/runit/runsvdir/default/
fi

if ! groups odroid | grep -q '\bnetwork\b'; then
    gpasswd -a odroid network
fi

[ -f /proc/sys/kernel/nmi_watchdog ] && echo 0 > /proc/sys/kernel/nmi_watchdog
[ -f /roms/saves ] && mkdir -p /roms/saves && chown odroid:odroid /roms/saves

echo performance > /sys/devices/platform/dmc/devfreq/dmc/governor
/usr/bin/setfreq ${cpufreq:-1296000}

echo 1500 > /proc/sys/vm/dirty_writeback_centisecs
#echo disabled > /sys/class/net/wlan0/device/power/wakeup

echo mmc0 > /sys/class/leds/blue:heartbeat/trigger

/usr/bin/iw dev wlan0 set power_save off

if ! egrep -q "joypad_autoconfig_dir.*/usr/share" /home/odroid/.config/retroarch/retroarch.cfg; then
    rm /home/odroid/.config/retroarch/retroarch.cfg
fi

