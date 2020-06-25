#!/bin/sh

# script based on https://salsa.debian.org/raspi-team/image-specs/-/blob/master/rpi-resizerootfs

if [ ! -f /firstboot ]; then
    exit 0
fi

amixer set 'Playback Path' 'SPK'
alsactl store
light -S 50

sync

rootpart=/dev/mmcblk0p2
rootdev=/dev/mmcblk0

sfdisk -f $rootdev -N 2 <<EOF &>/dev/null
,+
EOF

sleep 5

udevadm settle

sleep 5

partprobe $rootdev

mount -o remount,rw $rootpart
resize2fs $rootpart &> /dev/null

sync

touch /forcefsck
rm /firstboot

