#!/bin/sh

RUNSVROOT=/etc/runit/runsvdir/default
SVROOT=/etc/sv

[ -f /boot/rrvl.defaults ] && . /boot/rrvl.defaults

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
    rm -f $f
done

for f in /sys/devices/platform/ff400000.gpu/devfreq/ff400000.gpu/governor /sys/devices/platform/dmc/devfreq/dmc/governor /sys/devices/system/cpu/cpufreq/policy0/*; do
	chgrp adm $f
	chmod 775 $f
done

chmod 777 /dev/tty1
chmod 777 /dev/vpu_service

for svc in dbus agetty-tty2 agetty-console NetworkManager; do
    ln -snf "$SVROOT/$svc" "$RUNSVROOT/"
done

gpasswd -a odroid network

[ -f /proc/sys/kernel/nmi_watchdog ] && echo 0 > /proc/sys/kernel/nmi_watchdog

mkdir -p /roms/saves && chown odroid:odroid /roms/saves
mkdir -p /roms/bios && chown odroid:odroid /roms/bios

echo performance > /sys/devices/platform/dmc/devfreq/dmc/governor
/usr/bin/setfreq ${cpufreq:-1296000}

echo 1500 > /proc/sys/vm/dirty_writeback_centisecs
#echo disabled > /sys/class/net/wlan0/device/power/wakeup

echo mmc0 > /sys/class/leds/blue:heartbeat/trigger

sed -i /home/odroid/.config/retroarch/retroarch.cfg  -e 's#joypad_autoconfig_dir.*#joypad_autoconfig_dir = "/usr/share/libretro/autoconfig"#'
sed -i /home/odroid/.config/retroarch/retroarch.cfg  -e 's#libretro_info_path.*#libretro_info_path = "/usr/share/libretro/info"#'
sed -i /etc/rc.local  -e 's#/usr/bin/onboot.sh.*##'

